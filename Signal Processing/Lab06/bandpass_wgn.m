%% MyFilter
% I am trying to replicate the signal TF_Signal.txt from lab06

close all, clear all, clc;

%% data
hW = ones(1,128); % window of the spectrogram
Nfft = 1000; % number of points for the FFT algorithm
Istep = 10; % time step used when evaluating the spectrogram
Flag = 1; % for plotting the signal

%% design
h = myfilter; 
N = 10000;
x = randn(1,N);

y = filter(h.Numerator, 1, x); % filter the wgn in time

f = 1/(N)* [0 : N/2]; 

%% test
data = load('TF_Signal.txt'); % starting point
mySpectrogram(data', Istep, Nfft, hW, Flag, 'TF\_signal'); 

my_signal = y; % filtered noise 

f1 = 0.15; % frequency of the sinusoid
n = 1:10000;
x1 = cos(2*pi*f1*n); % sinusoid

my_signal = my_signal+x1; % creating new sinusoid

f2 = 0.38; % frequency of the truncated sinusoid
x2 = cos(2*pi*f2*n);
x_trunc = zeros(1, length(x2));
x_trunc(5000:8000) = x2(5000:8000);

my_signal = my_signal+x_trunc;

% I need to generate a quadratic chirp: in order to do this I need to have
% in the equation of the sinusoid the integration of the equation of a
% parabola. This parabola has its vertex in (-b/2a, b^2/4a) since it passes
% through the origin.
a = - 4*0.45/(169e6); 
b = -13000*a;

f0 = 0; % starting point 

x_par = cos(2*pi*(b*n.^2/2 + a*n.^3/3)); % I need to multiply by a factor of 2pi since the formula requires omega,
% which is 2*pi*f. In this way I can obtain the correct value. 

my_signal = my_signal+x_par;

Px = mySpectrogram(my_signal, Istep, Nfft, hW, 1, 'my signal'); 

    