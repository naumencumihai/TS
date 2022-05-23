clc; clear all; close all;
s = tf('s'); % variabila s

% first order
k = 100;
T = 2;
H1 = k / (T * s + 1);

% second order
w = 5;
z = -0.5;
H2 = w^2 / (s^2 + 2*w*s*z + w^2);

% poli si zerouri
% figure;
% pzmap (H1);
% figure;
% pzmap (H2);

pole(H1)
pole(H2)

%zpk([], [-0.5], 50)
zpk([], [ -0.4000 + 1.9596i, -0.4000 - 1.9596i], 2)

isstable(H1)
isstable(H2)

% impuls
% figure;
% impulse(H1);
% figure;
% impulse(H2);

% treapta
figure; 
step(H2);



