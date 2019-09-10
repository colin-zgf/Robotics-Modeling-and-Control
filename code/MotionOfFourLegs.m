clear
close all
clc
W = 0.1; L = 0.2;
L1 = 0.1; L2 = 0.1;
leg = SerialLink([0, 0, 0, pi/2; 0, 0, L1, 0; 0, 0, -L1, 0;], ...
    'name', 'leg', 'base', eye(4, 4),...
    'tool', trotz(pi/2)*trotx(-pi/2)*trotz(-pi/2),...
    'offset', [pi/2 0 -pi/2]);
legs(1) = SerialLink(leg, 'name', 'leg1');
legs(2) = SerialLink(leg, 'name', 'leg2', 'base', transl(-L, 0, 0));
legs(3) = SerialLink(leg, 'name', 'leg3', 'base', transl(-L, -W, 0) * trotz(pi));
legs(4) = SerialLink(leg, 'name', 'leg4', 'base', transl(0, -W, 0) * trotz(pi));
% create a fixed size axis for the robot, and set z positive downward
clf; axis([-0.3 0.1 -0.2 0.2 -0.15 0.05]); set(gca,'Zdir', 'reverse')
hold on
% draw the robot's body
patch([0 -L -L 0], [0 0 -W -W], [0 0 0 0], ...
    'FaceColor', 'r', 'FaceAlpha', 0.5)
% TRajectory
xf = 50; % forward limts of leg motion
xb = -xf; % backward limits of leg motion
y = 50; % the distance of the foot from the body in the y-direction
zu = 20; % the height of the foot in the z-direction for foot up
zd = 50; % the height of the foot in the z-direction for foot down
path = [xf y zd; xb y zd; xb y zu; xf y zu; xf y zd] * 1e-3;
% Sample the multi-segment path at 100 Hz
p = mstraj(path, [], [0, 3, 0.25, 0.5, 0.25], path(1,:), 0.01, 0);
qcycle = leg.ikine(transl(p), 'mask', [1,1,1, 0, 0, 0]);

plotopt = {'noraise', 'nobase', 'noshadow', 'nowrist', 'nojaxes', 'delay', 0};
opt.niterations = 400;

for i=1:4
    legs(i).plot(qcycle(1,:), plotopt{:});
end
hold off

% walk!
k = 1;

for i=1:opt.niterations
    legs(1).animate( gait(qcycle, k, 0,   0));
    legs(2).animate( gait(qcycle, k, 100, 0));
    legs(3).animate( gait(qcycle, k, 200, 1));
    legs(4).animate( gait(qcycle, k, 300, 1));
    drawnow
    k = k +1;
end
