clc; clear all; close all;
s = tf('s'); % variabila s

% Punctul a

k = 100;
T = 2;
H = k / (T * s + 1);

isstable(H) 
% sistem stabil
pole(H)
% pol unic: -0.5


% Punctul b

w = 5;
z = -0.5;
% H2 == H'
H2 = w^2 / (s^2 + 2*w*s*z + w^2); 

pole(H2)
% poli: 2.5000 + 4.3301i, 
%       2.5000 - 4.3301i

% Punctul c

figure('name','Semnal treapta (functia H)','NumberTitle','off');
step(H);
figure('name',"Semnal treapta (functia H')",'NumberTitle','off');
step(H2);
% Amplitudinea oscilaţiilor este continuu crescatoare, rezulta faptul ca
% sistemul descris de H'(punctul b) este instabil

% Punctul d

figure('name','Semnal impuls (functia H)','NumberTitle','off');
impulse(H);

