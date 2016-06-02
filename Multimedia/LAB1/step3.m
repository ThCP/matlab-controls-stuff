%% Step 3
close all;
clear;
clc;

%Load image
Image = double(imread('lena512.bmp'));

QF_vector = [15 30 45 60 75 90];
MSE = [];
bitrate = [];

D = dctmtx(8);
for i=1:length(QF_vector)
    [MSE(i), bitrate(i)] = rate_distortion_curve(QF_vector(i), Image, D);
end

figure, plot(bitrate, MSE);
title('Rate-distortion curve');
xlabel('bitrate (bpp)');
ylabel('MSE');