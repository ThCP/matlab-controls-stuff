%% Generate Ornstein-Uhlenbeck

% V[n] = V[n-1]exp(-beta*Ts)+DV[n]
% V[0] = 0
% DV[n] ~ N(0,1/(2*beta)*(1-exp(-2*beta*Ts)))

function V = my_ornstein_uhlenbeck(N, Ts, beta)
n = [0:1:N-1];

DV = random ('norm', 0, (1/(2*beta)*(1-exp(-2*beta*Ts)))^(1/2), 1, N); %% #################### CONTROLLA
V = zeros(1,N);

V(1) = 0;

for i=2:N
    V(i) = V(i-1)*exp(-beta*Ts) + DV(i);
end
    