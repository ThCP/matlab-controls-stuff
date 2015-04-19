%% Exercise 1 part 3
% Use the Nichols plot of the loop function L(s) and use its Nichols chart
% to derive the behavior of the Bode magnitude plot of the complementary
% sensitivity function T(s)

%% Initialization
clc;
clear all, close all;

s = tf('s');
C = -0.5;
G = -(1-s)/(s*(1+s)^2*(1+s/5));
L = zpk(minreal(G*C));

%% Nichols plot
figure, nichols (L);
% I find the value of M_t such that the locus is tangent to the graph
hold on, t_grid(16.65);
% I compare the result above with the bode plot of T
T = L/(1+L);
% The peak value of the bode plot is equal to the value of M_t used above.
%% Bode plot of T(s)
figure, bodemag (T);
% The bandwidth of the system can be found by checking the value of the
% frequency when the mag. is = -3dB
W_b = 0.806