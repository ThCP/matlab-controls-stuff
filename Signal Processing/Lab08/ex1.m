%% Lab 08 
% Exercise 1

%% Initialization

clear all, close all, clc;

%% Data definition
% H0: x[n] = F[n]
% H1: x[n] = A + F[n]
% F is WGN, A is a positive constant

% I need to decide whether I am in the case H0 or in the case H1

P_fa = 0.01:0.08:0.97; % P false alarm
A = [ 0.1 0.5 1 2 4 ]; % size of the disturbance
N = 1; % Number of samples 
o = 1; % Sigma

g_threshold = sqrt ( o^2 / N ) * Qinv(P_fa); % gamma

for ii=1:length(A)
    P_D = Q ( (g_threshold - A(ii)) / sqrt(o^2/N) );
end

plot (P_fa, P_D);
xlabel('P_{FA}');
ylabel('P_{D}');
title('Exercise 1');

ax = gca;
ax.XTick = P_fa;
% ax.YTick = P_D;