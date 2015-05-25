%% Lab 04 Exercise 1
% Author: Riccardo Cappuzzo

%% Initialization
s = tf ( 's' );

C = -0.5;
G = -(1-s)/(s*(1+s)^2*(1+s/5));

%% Computation of max
L = C*G;
T = L/(1+L);

bode (T); % Show graph
m = bode(T); % Find the values of magnitude

T_p = max(m); % Extract max. value of magnitude

gamma_M = 1/T_p; % Compute the value of gamma_M

