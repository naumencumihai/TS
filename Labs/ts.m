clear all
close all
clc

A = [-5 1 0 0; 0 -5 1 0; 0 0 -9 1; 0 0 0 -3];
B = [1; 2; 3; 4];
C = [ 1 0 0 0];
D = 0;

sys = ss(A, B, C, D)

isstable(sys);

R = ctrb(A, B);
rank(R)

Q = obsv(A, C);
rank(Q)

[b, a] = ss2tf(A, B, C, D)

P = tf(b, a);

opt = c2dOptions('Method', 'tustin', 'FractDelayApproxOrder', 3);
H = c2d(P, 0.1, opt);
%bodeplot(H);

kalman(P)

