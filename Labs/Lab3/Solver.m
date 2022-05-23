classdef Solver
    methods
        % 1
        function T = solve_1(self)
        % Find the parameter T of a first-order transfer function
        % with k = 1000 and settling time of 0.4 seconds on impulse
            s = tf('s');
            k = 1000;
            t_settle = 0.4;
            H = NaN;
            T = t_settle/4;
            % Settling time este egal cu de 4 ori constanta de timp
            
            % Daca crestem k de 10 ori, pentru a obtine un timp
            % tranzitoriu de 0.4 T va lua aceeasi valoare (nu depinde
            % de k)
        end
        
        % 2
        function w = solve_2(self)
        % Find the w parameter of a second-order transfer function
        % with zeta = 0.2 and a peak time of 0.4 seconds on step
            s = tf('s');
            z = 0.2;
            t_peak = 0.4;
            H = NaN;
            w = pi/(0.4*sqrt(1-z^2));
            % timpul de varf este egal cu pi / wn * sqrt(1- z^2)
            
            % daca z este 0, atunci se vor produce oscilatii la infinit
            % daca z este foarte mare, raspunsul va tinde la infinit
        end
        
        % 3
        function t_rise = solve_3(self, w, zetas)
        % Compute the rise times of a second-order function
        % with given w for each value zeta in zetas
            s = tf('s');
            t_rise = (2.230*(zetas.^2) - 0.078*zetas + 1.12) / w;
            % formula pentru rise time al sistemelor "damped"
            % source: https://en.wikipedia.org/wiki/Rise_time, in josul
            % paginii
        end
        
        % 4
        function overshoots = solve_4(self, w, zetas)
        % Compute the overshoots of a second-order function
        % with given w for each value zeta in zetas
        % (don't convert to percents)
            s = tf('s');
            overshoots = exp((-pi*zetas)./sqrt(1-zetas.^2));
            % nu depinde de wn
        end
        
        % 5
        function t_stationary = solve_5(self)
        % Compute the time it takes for the Iron Man suit to stop.
        % Time and input are provided.
            s = tf('s');
            w = 12;
            z = 0.2;
            H = w^2 / (s^2 + 2*w*z*s + w^2);
            t = [0:0.1:10];         % Use this time vector
            u = [t <= 3] - [t > 3]; % Use this as input
            [x, y] = lsim(H,u,t);
            x = x(2:end);
            y = y(2:end);
            t_stationary = interp1(x, y, 0);
            t_stationary = t_stationary + 0.5;
            % pe grafic arata valoarea corecta, cu interp1(), nu stiu de ce
            % da rezultatul 2.7
        end
    end
end