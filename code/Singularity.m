clear
close all
clc
mdl_puma560
T1 = transl(0.5, 0.3, 0.44) * troty(pi);
T2 = transl(0.5, -0.3, 0.44) * troty(pi/2);
t = [0:0.05:2];
% Based on cartesian coordinate
Ts = ctraj(T1, T2, length(t));
qc = p560.ikine6s(Ts);
p = transl(Ts);
% p560.plot(q_method3)
% figure, plot(q_method3(:, 2))
q_method3 = p560.jtraj(T1, T2, t);
figure, qplot(t, qc)
figure, plot(t, p), legend('x', 'y', 'z');
figure, plot(p(:, 1), p(:,2));
figure, plot(t, tr2rpy(Ts)), legend('roll', 'pitch', 'yaw');
