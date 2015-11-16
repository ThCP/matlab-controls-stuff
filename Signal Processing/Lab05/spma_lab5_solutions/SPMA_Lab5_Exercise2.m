% Signal processing: methods and algorithms
% Laboratory 5
% Exercise 2: Spectral estimation

clc;
clear;
close all;

% 1.
x=load('SpectralEstimation.txt','-ascii');
N=length(x);
n=0:N-1;
figure,plot(n,x),axis('tight');
xlabel('n'),ylabel('$$X[n]$$','Interpreter','Latex');

% 2. Basic periodogram
X=fft(x);
Px=1/N*abs(X(1:N/2+1)).^2;
f=1/N*(0:N/2);
figure,plot(f,Px),axis('tight');
xlabel('f'),ylabel('$$\hat{P} (f)$$','Interpreter','Latex');

% 3. Welch periodogram
Nwel=1000;
h=ones(1,Nwel);
Noverlap=Nwel/2;
Nfft=Nwel;
Fs=1;
[Px,f]=pwelch(x,h,Noverlap,Nfft,Fs);
figure,plot(f,Px),axis('tight');
xlabel('f'),ylabel('$$\hat{P} (f)$$','Interpreter','Latex');