%% Optical illusion withc cyclic mu and constant variance
% The variance is the derivative of the mean. This should lead to an
% optical illusion which makes the variance look constant even if it
% actually isn't. 

close all, clear all, clc;

MAX_LENGTH = 10000;
F = randn(1,MAX_LENGTH);

n = linspace(0, 9, MAX_LENGTH);

% n = 1:1:MAX_LENGTH;

mu1 = -10; % lower limit

mu2 = +10; % upper limit

% sigma = ones(1,MAX_LENGTH);

A = abs(mu1-mu2); % find the amplitude
bias = (mu1+mu2)/2; % find the middle point

T = 3; 

mu = A * cos ( 2*pi/T*n ) + bias; % sinusoidal mu
sigma = -A * 2 * pi/T * sin ( 2*pi/T*n); % sigma is the derivative of mu

X = sigma .* F + mu; % definition of X

figure;
plot (n, X, n, mu, n, mu+sigma, n, mu-sigma);   
title('X[n] with cyclic mu');
