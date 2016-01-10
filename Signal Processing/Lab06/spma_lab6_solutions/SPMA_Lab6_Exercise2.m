% Signal processing: methods and algorithms
% Laboratory 6
% Exercise 2: Time-frequency analysis of nonstationary signals

clc;
clear;
close all;

N=1000;
n=0:N-1;

% 2.1 Simple sinusoid
f0=0.15;
x=cos(2*pi*f0*n);

% 2.1.1
figure,plot(n,x),axis('tight');
xlabel('n'),ylabel('x[n]');

% 2.1.2
Istep=10;
Nfft=1024;
Nw=100;
h=hamming(Nw);
PlotFlag=1;
Px=Spectrogram(x,Istep,Nfft,h,PlotFlag);

% 2.2 Four sinusoids
f1=0.1;
f2=0.2;
f3=0.3;
f4=0.4;
n0=0:249;
x=[cos(2*pi*f1*n0) cos(2*pi*f2*n0) cos(2*pi*f3*n0) cos(2*pi*f4*n0)];

% 2.2.1
figure,plot(n,x),axis('tight');
xlabel('n'),ylabel('x[n]');

% 2.2.2
Px=Spectrogram(x,Istep,Nfft,h,PlotFlag);

% 2.2.3
Nw1=20;
h=hamming(Nw1);
Px=Spectrogram(x,Istep,Nfft,h,PlotFlag);

Nw2=500;
h=hamming(Nw2);
Px=Spectrogram(x,Istep,Nfft,h,PlotFlag);

% 2.3 Linear chirp

% 2.3.1
N=10000;
n=0:N-1;
f1=0.1;
f2=0.3;
f0=f1;
b=2*pi*(f2-f1)/N;
x=cos(2*pi*f0*n+b*n.^2/2);
figure,plot(n,x),axis('tight');
xlabel('n'),ylabel('x[n]');

% 2.3.2
Nw=100;
h=hamming(Nw);
Px=Spectrogram(x,Istep,Nfft,h,PlotFlag);

% 2.4 Multi-component signal
x=load('TF_Signal.txt','-ascii');
Px=Spectrogram(x.',Istep,Nfft,h,PlotFlag);