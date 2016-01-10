%% draw ciao in spectrogram

close all, clear all, clc;

%% data
hW = ones(1,128); % window of the spectrogram
Nfft = 1000; % number of points for the FFT algorithm
Istep = 10; % time step used when evaluating the spectrogram
Flag = 1; % for plotting the signal


f0 = 0.15;
n = linspace(0, 1, 10000);
x = (cos(2*pi*f0*n)).^2;
y = (sin(2*pi*f0*n)).^2;

r = 1;

z = cos ( 2*pi*1/2*((sqrt(r-n.^2)).*n + asin(n)) );
func = 1/2*((sqrt(r-n.^2)).*n + asin(n));
s = cumsum(func);
plot (n,s)

mySpectrogram(z, Istep, Nfft, hW, 1, 'my signal'); 
