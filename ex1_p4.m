%% Exercise 1 part 4
% Use the Nichols plot of the loop function L(s) and the S_grid statement
% to evaluate the resonant peak S_p of the sensitivity function S(s) and
% its bandwidth W_bs.

%% Initialization
clc, clear all, close all;

s = tf('s');

C = -0.5;
G = -(1-s)/(s*(1+s)^2*(1+s/5));
L = zpk(minreal(G*C));

%% Nichols plot
% I draw the nichols plot
figure, nichols (L);
% I find the value of M_t such that the locus is tangent to the graph
hold on, s_grid(17.5);

%% Bode plot of S(s)
% I compare the result above with the bode plot of S
S = 1/(1+L);
% The peak value of the bode plot is equal to the valueof M_t used above
figure, bodemag (S);
% The bandwidth of the system can be found by checking the value of the
% frequency when the mag. is = -3dB
W_b = 0.25