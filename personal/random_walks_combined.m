%% Random walks together
% This script takes the random walk scripts/functions and combines them in
% a single plot.

% clear all,  clc;

N = 1000; % Number of samples
beta = 0.1; % Friction coefficient, needed for Ornstein-Uhlenbeck
Ts = 1; % Sampling time, needed for Ornstein-Uhlenbeck and Wiener

X1 = random_walk_orn_uhl(N, Ts, 0.01);
X2 = random_walk_uniform(N, Ts);
X3 = random_walk_wiener(N, Ts);

n = 0:1:N-1;
figure
plot (n, X1, n, X2, n, X3);
legend ('ornstein-uhlenbeck', 'uniform', 'wiener');

plot_mean_signal(X1, 50, 'ornstein-uhlenbeck');
plot_mean_signal(X2, 50, 'uniform');
plot_mean_signal(X3, 50, 'wiener');
