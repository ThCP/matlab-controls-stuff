 %% Audio sampling

close all, clear all, clc;

filename='/home/riccardo/09 - Viva La Vida.flac';
% filename='/home/riccardo/enV - Electronic Super Joy OST - 11 Switchblade.flac'

[y,Fs] = audioread(filename);

samples = [1,2*Fs]; % fetch samples from 1 to 2 * Fs, i.e. 2 seconds of audio

clear y Fs

[y,Fs] = audioread(filename, samples);
% sound(y,Fs)
% pause

%% starting sample
n = 0:1:length(y)-1;
N = length(n);
T = 1/Fs

plot (n,y(:,1)); title ('starting sample');

%% spectrum
X = fft(y(:,1));

Xpos = X(1:N/2); % without this truncation I see the repetition of the spectrum
f = 1/N*(0:N/2-1); 

figure
plot (f, Xpos);
title ('spectrum X of the input signal');
axis tight
% return

%%
Xabs = abs(Xpos);
% Xabs = abs(X);
figure, plot (f,Xabs), title('Xabs');
% axis tight
% xlim([0, 0.1]);

fraction = 0.1;

% Xtrunc = Xpos(1:0.08*length(Xpos));
Xtrunc = X(1:fraction*length(X));

% ftrunc = f(1:fraction*length(f));

% figure, plot(ftrunc, Xtrunc), title('Xtrunc');
% xlim([0, .1]);
Xnew = zeros(1,length(Xpos));
% Xnew = zeros(1,length(X));
Xnew(1:length(Xtrunc))=Xtrunc;

figure, plot(f, Xnew), title('Xnew');
% xlim([0, 0.1]);
return

xnew = ifft(Xnew);
figure
plot (n, xnew);

% sound(abs(xnew), Fs);