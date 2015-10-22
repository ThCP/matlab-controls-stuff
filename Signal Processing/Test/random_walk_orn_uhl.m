%% Random walk generator with Wiener processes
% This function receives as parameters the number of steps N of the random
% walk, the friction beta and the sampling time Ts. It returns an array 
% which contains the random walk built according to the Ornstein-
% Uhlenbeck process.

% The discretization is the following:
% V[n] = V[n-1]exp(-beta*Ts)+DV[n]
% V[0] = 0
% DV[n] ~ N(0,1/(2*beta)*(1-exp(-2*beta*Ts)))

function V =random_walk_orn_uhl (N, Ts, beta)

n = [0:1:N-1];

DV = random ('norm', 0, 1/(2*beta)*(1-exp(-2*beta*Ts)), 1, N); 

V = zeros(1,N);
% return
V(1) = 0;
for i=2:N
    V(i) = V(i-1)*exp(-beta*Ts) + DV(i);
end

% plot (n, V);
