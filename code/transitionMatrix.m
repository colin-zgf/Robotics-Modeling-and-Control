clear 
close all
clc
A1 = transformationMatrix(0+pi/2, 0, 0, pi/2);
A2 = transformationMatrix(0, 0, 0.1, 0);
A3 = transformationMatrix(0-pi/2, 0, -0.1, 0);
T = A1 * A2 * A3 * trotz(pi/2) * trotx(-pi/2) * trotz(-pi/2)