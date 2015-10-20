%% 2d Ornstein-Uhlenbeck process

% V[n] = V[n-1]exp(-beta*Ts)+DV[n]
% V[0] = 0
% DV[n] ~ N(0,1/(2*beta)*(1-exp(-2*beta*Ts)))

close all, clear all, clc;

N = 10000;

Ts = 0.1;

beta = 0.1;
n = [0:1:N-1];


DV = random ('norm', 0, 1/(2*beta)*(1-exp(-2*beta*Ts)), 2, N); 
% generates a matrix of size 1*N containing values distributed according to
% the chosen probability distribution

V = zeros(2,N);

    
for i=2:N
    V(1,i) = V(1,i-1)*exp(-beta*Ts) + DV(1,i);
    V(2,i) = V(2,i-1)*exp(-beta*Ts) + DV(2,i);

end

plot (V(1,:), V(2,:));
