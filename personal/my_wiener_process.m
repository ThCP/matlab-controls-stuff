%% Generate Wiener process

% W[n] = W[n-1]+DW[n]
% W[0] = 0
% DW[n] ~ N(0,Ts)

function W = my_wiener_process (N, Ts)
n = [0:1:N-1];

DW = random ('norm', 0, Ts, 1, N);

W = zeros(1,N);
W(1) = 0;
    
for i=2:N
    W(i) = W(i-1) + DW(i);
end
