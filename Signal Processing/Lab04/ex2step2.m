%% Lab 04
% Exercise 2 step 2

clear all, close all, clc;

N = 10000;
F = randn(1,N);

mu_est = sliding_mean (F, 500);

n = 0:1:N-1;

mu_F = zeros(1,N);

plot (n, F, n, mu_est, n, mu_F);
legend ('mu_{est}', 'F', 'mu_F');
title('White Gaussian Noise');
