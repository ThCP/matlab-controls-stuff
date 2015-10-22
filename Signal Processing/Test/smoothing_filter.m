%% Smoothing filter

close all, clear all, clc;

N_MAX = 100;

n = [1:1:N_MAX];

A = randn(1,N_MAX);

B = zeros(1,N_MAX);

B(1) = A(1);

for i=1:N_MAX-1
%    cumulative moving average
   B(i+1) = (A(i+1) + i*B(i))/(i+1); 
end

plot (n, A, n, B);
