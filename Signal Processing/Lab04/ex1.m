%% Lab 04
% Exercise 1

clear all, close all, clc;

%% Step 1
% Work with WGN

N = 1000;

F = randn(1,N);

mu_F = mean (F); % mean of WGN
var_F = var (F); % variance of WGN

[r_F_biased, l] = xcorr (F, 'biased'); % biased operator, at +-inf diverges

[r_F_unbiased, l] = xcorr (F, 'unbiased'); % unbiased operator, asymp. biased

plot (l, r_F_unbiased, l, r_F_biased);
xlim([-(N-1) (N-1)]);
legend('unbiased', 'biased');

%% Step 2
% Work with Ornstein-Uhlenbeck process

N = 1e6; % number of samples
Ts = 1;
beta = 0.01;

Ntr = 10/(beta*Ts); % numer of samples included in the transient
N0 = Ntr+N; % samples of the entire signal

V_transient = my_ornstein_uhlenbeck(N0, Ts, beta); % entire signal

V = V_transient(Ntr:length(V_transient)); % truncated signal (no transient)

figure
plot (1:1:length(V_transient), V_transient);
xlim([1000 2000]); % set the limits of the xaxis so to show the overlap of
                    % V_transient and V 
legend ('V[n]');

figure
plot (1:1:length(V), V);
xlim([0 1000]);
legend ('Vss[n]');

mu_V = mean (V);
var_V = var (V);

max_lag = N/10;% I decide the length of the interval used when computing xcorr

[r_V_xcorr, l] = xcorr (V, max_lag);

r_V_theoretical = 1/(2*beta) * exp (-beta * abs(Ts*l)); % in 0 it should be 50

figure
plot (l, r_V_xcorr, l, r_V_theoretical); % show the difference
legend('r[l] calculated', 'r[l] theoretical');
