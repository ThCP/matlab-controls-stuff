%% Synthesize a random walk (Ornstein-Uhlenbeck)

clear all, close all, clc;

N = 1e5;

n = 0:1:N-1;

beta = 1;% Beta must be high, 

X = random_walk_orn_uhl(N, 1, beta);

plot(n,X);

m = max(X);

X = X./(4*m);

figure;
plot(n,X); % check if the values are acceptable before playing

return
pause;
sound(X, N/2);