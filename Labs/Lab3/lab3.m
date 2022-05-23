clear all;
close all;
clc

%s = tf('s');

%K = 1000;
%T = 0.1;

%H = K/(T*s + 1);

%impulse(H);

%z = 10;
%wn = pi / (0.4 * sqrt(1 - z^2));


%H2 = wn^2/(s^2+2*z*wn*s+1);

%step(H2);
%stepinfo(H2)
%figure;
%pzmap(H2);
%stepinfo(H2);



            s = tf('s');
            w = 12;
            z = 0.2;
            H = w^2 / (s^2 + 2*w*z*s + w^2);
            t = [0:0.1:10];         % Use this time vector
            u = [t <= 3] - [t > 3]; % Use this as input
            [x, y] = lsim(H, u, t);
            x = x(2:end);
            y = y(2:end);
            f = interp1(x,y,0);
            f
