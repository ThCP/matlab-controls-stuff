% Signal processing: methods and algorithms
% Laboratory 5
% Exercise 1: Analysis of atomic clock data

clc;
clear;
close all;

x=load('AtomicClock.txt');
N=length(x);
n=0:N-1;

% 1.
Nw=100;
Istep=10;
Iplot=1:Istep:N;
mu_est=sliding_mean2(x.',Nw,Istep);

% 2.
figure,plot(n,x,'k',n(Iplot),mu_est,'r'),axis('tight');
xlabel('n');
h=legend('X[n]',...
    ['$$\hat{\mu}_X[n]$$ obtained with $$N_w=' int2str(Nw) '$$'],...
    'Location','NorthEast');
set(h,'Interpreter','Latex');

% 3.
sigma_est=sliding_std2(x.',Nw,Istep);

% 4.
figure,plot(Iplot,sigma_est),axis('tight');
xlabel('n'),ylabel('$$\hat{\sigma}[n]$$','Interpreter','Latex');

% 5.
s1=mu_est+2*sigma_est;
s2=mu_est-2*sigma_est;
figure,plot(n,x,'k',n(Iplot),mu_est,'r',n(Iplot),s1,'b',n(Iplot),s2,'b');
axis('tight');
xlabel('n');
h=legend('X[n]',...
    ['$$\hat{\mu}_X[n]$$ obtained with $$N_w=' int2str(Nw) '$$'],...
    '$$s_1[n]=\hat{\mu}_X[n]+2\hat{\sigma}_X[n]$$',...
    '$$s_2[n]=\hat{\mu}_X[n]-2\hat{\sigma}_X[n]$$',...
    'Location','NorthEast');
set(h,'Interpreter','Latex');