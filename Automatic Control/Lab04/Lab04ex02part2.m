%% Lab 04 Exercise 2
% Author: Riccardo Cappuzzo

%% Part 2
% Verify if the control system can be robustly stabilized by the control
% function C = 1.86e-6/(1+s/0.005)

% Add to the function G the delay R
G_del = G;
G_del.inputdelay = R_nom;

% Use the Padè approximation of order 2
G_app = zpk ( pade (G_del, 2) );

% Apply the Nyquist stability criterion to the tf L = G*C
L = G_app * C;

% 1. Find the number of poles with positive real part.
p = pole (L);
P = length (find (p>0));
% 2. Draw the Nyquist diagram of L(s)
figure, nyquist (L);
% 3. Count the number of encirclements of the Nyq. diagram arount the
% critical point.
% No encirclements
N = 0;
Z = N+P;

