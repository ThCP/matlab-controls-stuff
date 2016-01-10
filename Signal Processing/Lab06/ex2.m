%% Lab06 ex2

clear all, close all, clc;

N = 1000;
n = 1:N;

h = ones(1,64);
Nfft = 1000;
Istep = 10;
Flag = 1;

%% step 1
f0 = 0.15;
x1 = cos(2*pi*f0*n);
title('x1 - simple sinusoid');
plot (n, x1);

mySpectrogram(x1, Istep, Nfft, h, Flag, 'simple sinusoid'); 
% return
%% step 2
f1 = 0.1;
f2 = 0.2;
f3 = 0.3;
f4 = 0.4;

% n1 = 0:249;
% n2 = 250:499;
% n3 = 500:749;
% n4 = 750:999;

n = 0:249;

% x_1 = cos(2*pi*f1*n1);
% x_2 = cos(2*pi*f2*n2);
% x_3 = cos(2*pi*f3*n3);
% x_4 = cos(2*pi*f4*n4);

x_1 = cos(2*pi*f1*n);
x_2 = cos(2*pi*f2*n);
x_3 = cos(2*pi*f3*n);
x_4 = cos(2*pi*f4*n);

x2 = [x_1 x_2 x_3 x_4];

figure
plot (1:1:1000, x2);
title('x2 - four sinusoid');
% return
mySpectrogram(x2, Istep, Nfft, h, Flag, 'four sinusoids'); 

%% step 3
N = 10000;
f1 = .1;
f2 = .3;
f0 = f1;
beta = 2*pi * (f2-f1)/N;
n = 1:10000;
x = cos(2*pi*f0*n + beta*n.^2/2);
figure, plot (n,x);
title('x3 - Linear chirp');
mySpectrogram(x, Istep, Nfft, h, Flag,'linear chirp'); 

%% step 4
data = load('TF_Signal.txt');
figure, plot (1:length(data), data);
title('x4 - TF\_Signal.txt');
mySpectrogram(data', Istep, Nfft, h, Flag, 'TF\_signal'); 
