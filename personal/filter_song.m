 %% Audio sampling

close all, clear all, clc;

% filename='/home/riccardo/09 - Viva La Vida.flac';
filename='/home/riccardo/enV - Electronic Super Joy OST - 11 Switchblade.flac'

[y,Fs] = audioread(filename);

samples = [1,2*Fs]; % fetch samples from 1 to 2 * Fs, i.e. 2 seconds of audio

clear y Fs

[y,Fs] = audioread(filename, samples);
% sound(y,Fs)
% pause

%% starting sample
n = 0:1:length(y)-1;
N = length(n);
T = 1/Fs;
x = y(:,1);
plot (n,x); title ('starting sample'); % I consider only one channel instead of 2

%% spectrum
X = fft(x);

Xpos = X(1:N/2); % without this truncation I see the repetition of the spectrum
f = 1/N*(0:N/2-1); 

figure
plot (f, Xpos);
title ('spectrum X of the input signal');
axis tight
% return

%% filtered sample
h = telephone;
z = filter(h.Numerator, 1, x);

figure
plot (n,z); title ('filtered sample'); % I consider only one channel instead of 2

%% filtered spectrum
Z = fft(z);

Zpos = Z(1:N/2); % without this truncation I see the repetition of the spectrum
f = 1/N*(0:N/2-1); 

figure
plot (f, Zpos);
title ('spectrum Z of the filtered signal');
axis tight
% return

sound(x, Fs);
pause;
sound(z, Fs);