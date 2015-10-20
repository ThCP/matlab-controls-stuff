%% Example Ornstein-Uhlenbeck process

% V[n] = V[n-1]exp(-beta*Ts)+DV[n]
% V[0] = 0
% DV[n] ~ N(0,1/(2*beta)*(1-exp(-2*beta*Ts)))

close all, clear all, clc;

N = 1000;

MAX_REPS = 1;

Ts = 0.1;

beta = 0.1;
n = [0:1:N-1];

% pd = makedist('Normal', 'mu', 0, 'sigma', Ts);

for rep=1:MAX_REPS
DV = random ('norm', 0, 1/(2*beta)*(1-exp(-2*beta*Ts)), 1, N); 
% generates a matrix of size 1*N containing values distributed according to
% the chosen probability distribution

V = zeros(1,N);
% return
V(1) = 0;
    
    for i=2:N
        V(i) = V(i-1)*exp(-beta*Ts) + DV(i);
    end

    plot (n, V);
    hold on;
end
    