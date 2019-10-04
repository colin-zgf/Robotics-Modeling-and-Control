clear
close all
clc
L1 = 0.1; L2 = 0.1;
leg = SerialLink([0, 0, 0, pi/2; 0, 0, L1, 0; 0, 0, -L1, 0;], ...
    'name', 'leg', 'base', eye(4, 4),...
    'tool', trotz(pi/2)*trotx(-pi/2)*trotz(-pi/2),...
    'offset', [pi/2 0 -pi/2]);

% TRajectory
xf = 50; % forward limts of leg motion
xb = -xf; % backward limits of leg motion
y = 50; % the distance of the foot from the body in the y-direction
zu = 20; % the height of the foot in the z-direction for foot up
zd = 50; % the height of the foot in the z-direction for foot down
path = [xf y zd; xb y zd; xb y zu; xf y zu; xf y zd] * 1e-3;
% Sample the multi-segment path at 100 Hz
p = mstraj(path, [], [0, 3, 0.25, 0.5, 0.25], path(1,:), 0.02, 0);
chose_path = p(1,:); % the inital location: [0.0493    0.0500    0.0500]

%% Inverse Kinematics
n = leg.n; % the number of link: (3)
tr = transl(chose_path); % transform the location 'chosen_path' into homogenous matrix
TT = SE3.convert(tr); % here it is the same as 'tr'
%  set default parameters for solution
opt.ilimit = 500;
opt.rlimit = 100;
opt.slimit = 100;
opt.tol = 1e-10;
opt.lambda = 0.1;
opt.lambdamin = 0;
opt.search = false;
opt.quiet = false;
opt.verbose = false;
opt.mask = [1 1 1 1 1 1];
opt.q0 = zeros(1, n);
opt.transpose = NaN;

varargin = {'mask', [1,1,1, 0, 0, 0]};
[opt, args] = tb_optparse(opt, varargin); % Update the 'mask' of opt to be [1 1 1 0 0 0]
assert(numel(opt.mask) == 6, 'RTB:ikine:badarg', 'Mask matrix should have 6 elements');
assert(n >= numel(find(opt.mask)), 'RTB:ikine:badarg', ... 
       'Number of robot DOF must be >= the same number of 1s in the mask matrix');
W = diag(opt.mask); % transform [1 1 1 0 0 0] into diagonal matrix. In this case the first diagonal elements 
                    % are 1 with the rest 0
qt = zeros(length(TT), n) % note length(TT) means the number of transformation matrix. 
                           % Since we only choose one locaiton point, it is 1 here
tcount = 0; % total interation count
rejcount = 0; % rejected step count
q = opt.q0;

failed = false;
revolutes = leg.isrevolute(); % Here output an array with element number equal the link number,
                              % 1 for revolute, otherwise 0

for i = 1:length(TT)
    T = TT(i); % The ith transformation matrix
    lambda = opt.lambda; % 0.1
    iterations = 0;
    while true
        % update the count and test against iteration limit
        iterations = iterations + 1;
        if iterations > opt.ilimit
            if ~opt.quiet
                warning('ikine: iteration limit %d exceeded (pose %d), final err %g', ...
                    opt.ilimit, i, nm);
            end
            failed = true;
            break
        end
        e = tr2delta(leg.fkine(q), T); % calculate the infinitesimal transformation, including 
                                       % (dx, dy, dz, dRx, dRy, dRz)
        % are we there yet
        if norm(W*e) < opt.tol
            break;
        end
        % compute the Jacobian
        J = jacobe(leg, q);

        JtJ = J'*W*J;

        if ~isnan(opt.transpose)
            % do the simple Jacobian transpose with constant gain
            dq = opt.transpose * J' * e;
        else
            % do the damped inverse Gauss-Newton with Levenberg-Marquadt
            dq = inv(JtJ + (lambda + opt.lambdamin) * eye(size(JtJ)) ) * J' * W * e;

            % compute possible new value of
            qnew = q + dq';

            % and figure out the new error
            enew = tr2delta(leg.fkine(qnew), T);

            % was it a good update?
            if norm(W*enew) < norm(W*e)
                % step is accepted
                if opt.debug
                    fprintf('ACCEPTED: |e|=%g, |dq|=%g, lambda=%g\n', norm(W*enew), norm(dq), lambda);
                end
                q = qnew;
                e = enew;
                lambda = lambda/2;
                rejcount = 0;
            else
                % step is rejected, increase the damping and retry
                if opt.debug
                    fprintf('rejected: |e|=%g, |dq|=%g, lambda=%g\n', norm(W*enew), norm(dq), lambda);
                end
                lambda = lambda*2;
                rejcount = rejcount + 1;
                if rejcount > opt.rlimit
                    if ~opt.quiet
                        warning('ikine: rejected-step limit %d exceeded (pose %d), final err %g', ...
                            opt.rlimit, i, norm(W*enew));
                    end
                    failed = true;
                    break;
                end
                continue;  % try again
            end
        end
        % wrap angles for revolute joints
        k = (q > pi) & revolutes;
        q(k) = q(k) - 2*pi;

        k = (q < -pi) & revolutes;
        q(k) = q(k) + 2*pi;

        nm = norm(W*e);
    end
    q
    qt(i,:) = q'
end