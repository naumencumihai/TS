% Naumencu Mihai, 322CD

clc; clear all; close all;

s = tf('s');

H = 1/(0.7*(s^2) + 0.1*s + 0.3);

%% Subiect 1
%% Punctul I

[wn, zeta] = damp(H);

% Pulsatia naturala
wn; % = 0.6547

% Coeficientul de amortizare
zeta; % = 0.1091

%% Punctul II

isstable(H); %sistem stabil

S = stepinfo(H); % suprareglaj = 70.82
% Suprareglajul este influentat de coeficientul
% de amortizare (zeta), acesta fiind egal cu 
% e ^ [(-pi*zeta)/(sqrt(1 - zeta^2))]

%% Subiect 2
%% Puncrul I

A = [-51 15 8; 12 10 2; -8 12 -80];
B = [0.2 0; 0.4 1; 0 0];
C = [1 4 0; 0 15 0];
D = [0 0; 0 0];

H2 = ss(A,B,C,D);
% Sistemul are: 3 stari (x), 2 intrari (u), 2 iesiri (y)

%% Punctul II

isstable(H2) % Sistem instabil

step(H2); % timp tranzitoriu ~ 4.1 secunde

% Este intrarea sistemului perfect urmarita de catre iesire?
% Raspuns: Da (conform graficului)

%% Punctul III

% Controlabilitatea

% Matricea de controlabilitate
R = ctrb(A,B);
Rang_R_1 = rank(R) % = 3

% Observabilitatea

% Matricea de observabilitate
Q = obsv(A,C);
Rang_Q_1 = rank(Q) % = 3

% Dinamica sistemului este descrisa de 3 stari,
% Rang_R_1 = 3; Rang_Q_1 = 3, asadar
% sistemul este controlabil si observabil


