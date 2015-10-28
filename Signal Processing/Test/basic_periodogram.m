%% Periodograms

clear all, close all, clc;

N = 100000;

n = 0:1:N-1;

x = random ('norm', 0,1, 1, N);

x_sampled = x(N/4:3/4*N-1);

P = (fft(x)).^2;
P_pos = P(1:N/2+1);

f = 1/N * (0:N/2);

plot (f, P_pos);

