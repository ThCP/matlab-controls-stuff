%% Audio file with multiplicative noise

clear all, close all, clc;

% filename='/home/riccardo/09 - Viva La Vida.flac';
filename='/home/riccardo/enV - Electronic Super Joy OST - 11 Switchblade.flac'

[y,Fs] = audioread(filename);

samples = [1,2*Fs]; % fetch samples from 1 to 2 * Fs, i.e. 2 seconds of audio

clear y Fs

[y,Fs] = audioread(filename, samples);

%% starting sample
n = 0:1:length(y)-1;
N = length(n);
T = 1/Fs;
x = y(:,1);

s = 0.5; % standard deviation

% keep the standard deviation high-ish
noise = random('norm', 0, s, N, 1);

x_noisy = x.*noise;

subplot(2,1,1);
plot(n,x); title('starting signal');
axis tight;
subplot(2,1,2);
plot(n,x_noisy); title('noisy signal');
axis tight;

return

sound(x,Fs);
pause;
sound(x_noisy,Fs);
