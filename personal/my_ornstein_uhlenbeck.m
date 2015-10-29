%% Generate Ornstein-Uhlenbeck
function V = my_ornstein_uhlenbeck(N, Ts, beta)
% The function receives as an input the number of samples, the sampling
% time and the value of beta and returns an Ornstein-Uhlenbeck process
% given as the solution of the Langevin equation.

% V[n] = V[n-1]exp(-beta*Ts)+DV[n]
% V[0] = 0
% DV[n] ~ N(0,1/(2*beta)*(1-exp(-2*beta*Ts)))

n = 0:1:N-1;

DV = random ('norm', 0, (1/(2*beta)*(1-exp(-2*beta*Ts)))^(1/2), 1, N); 
V = zeros(1,N);

V(1) = 0;

for i=2:N
    V(i) = V(i-1)*exp(-beta*Ts) + DV(i);
end