clear
close all
clc
L1 = 0.1; L2 = 0.1;
leg = SerialLink([0, 0, 0, pi/2; 0, 0, L1, 0; 0, 0, -L1, 0;], ...
    'name', 'leg', 'base', eye(4, 4),...
    'tool', trotz(pi/2)*trotx(-pi/2)*trotz(-pi/2),...
    'offset', [pi/2 0 -pi/2]);
clf; axis([-0.3 0.1 -0.2 0.2 -0.15 0.05]); set(gca,'Zdir', 'reverse')
hold on

% TRajectory
xf = 50; % forward limts of leg motion
xb = -xf; % backward limits of leg motion
y = 50; % the distance of the foot from the body in the y-direction
zu = 20; % the height of the foot in the z-direction for foot up
zd = 50; % the height of the foot in the z-direction for foot down
path = [xf y zd; xb y zd; xb y zu; xf y zu; xf y zd] * 1e-3;
% Sample the multi-segment path at 100 Hz
p = mstraj(path, [], [0, 3, 0.25, 0.5, 0.25], path(1,:), 0.02, 0);
qcycle = leg.ikine(transl(p), 'mask', [1,1,1, 0, 0, 0]);
plotopt = {'noraise', 'nobase', 'noshadow', 'nowrist', 'nojaxes', 'delay', 0};
opt.niterations = 500;
opt.movie = [];
% leg.teach();
leg.plot(qcycle(1,:), plotopt{:});
hold off

% walk!
k = 1;

for i=1:opt.niterations
    leg.animate( gait(qcycle, k, 0,   0));
    drawnow
    k = k + 1;
end