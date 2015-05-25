%% Lab 04 Exercise 4
% Author: Riccardo Cappuzzo

%% Initialization

s = tf('s');

G1 = zpk(2.5/(s*(1+0.4*s)));
G2 = zpk(- 1.33 / (1+0.0133*s));

C = -20.05;

L = C * G1 * G2;

nyquist (L);