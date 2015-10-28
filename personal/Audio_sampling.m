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

%% Power spectrum
Xabs = abs(Xpos);
% Xabs = abs(X);
figure, plot (f,Xabs), title('Xabs');
% axis tight
% xlim([0, 0.1]);

%% Truncated signal
fraction = 0.01; % Part of the spectrum I'm using

Xtrunc = X(1:fraction*length(X));

Xnew = zeros(1,length(Xpos));
Xnew(1:length(Xtrunc))=Xtrunc;

% figure, plot(f, Xnew), title('Xnew');
figure;
subplot(2,1,1);
plot(f, Xnew), title('Xnew');
axis tight
subplot(2,1,2);
plot (f, Xpos); title ('Xpos');
axis tight
% xlim([0, 0.1]);
% return

%% New real signal
xnew = ifft(Xnew);
figure
ntrunc = 1:1:N/2;
subplot(2,1,2);
plot (ntrunc, xnew); title ('xnew');
subplot(2,1,1);
plot (n, y(:,1)); title ('x');
% plot (n, xnew);

% sound(abs(xnew), Fs);