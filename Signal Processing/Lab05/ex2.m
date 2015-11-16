%% Lab 05
% ex2

close all, clear all, clc;

%% step 1
finn = fopen('SpectralEstimation.txt');
x = fscanf(finn, '%f');

N = length(x);

fclose(finn);

%% step 2
n = 0:1:N-1;
plot (n, x);

%% step 3
X_fft = fft(x);

Xpos = X_fft(1:N/2+1);
f = 1/N*(0:N/2);

basic_per = abs((Xpos).^2);
n = 0:1:N/2-1;
figure
plot (f, basic_per);
figure
plot (f, unwrap(angle(Xpos)));


%% step 4
pxx = pwelch(x, 2000);
figure;
plot (0:1:length(pxx)-1, pxx);
