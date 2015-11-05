%% Growth of a population with uniform distribution
% A population is described by a random variable. Such random variable
% starts at time t=0 with value 1.
% Each individual in the population can produce a single child every step,
% with a probability uniformly distributed.

clear all, close all, clc;

N = 5;
REPS = 10;

n = 0:1:N-1;

X = zeros(1,N);
X(1) = 1;

for ii=1:REPS
%     DX = random ('unif', 0, 1, 1, N);

    for i=2:N
%         X(i) = X(i-1) + round(X(i-1) * DX(i));
        DX = random('bino', X(i-1), 1/2, 1, 1);
        X(i) = X(i-1) + DX;
    end
    
    plot (n,X), hold on;
end

axis tight;