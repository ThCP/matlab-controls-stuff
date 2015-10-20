%% Example Wiener process

% W[n] = W[n-1]+DW[n]
% W[0] = 0
% DW[n] ~ N(0,Ts)

N = 1000;

MAX_REPS = 10;

Ts = 1;

n = [0:1:N-1];

% pd = makedist('Normal', 'mu', 0, 'sigma', Ts);

for rep=1:MAX_REPS
DW = random ('norm', 0, Ts, 1, N);

W = zeros(1,N);
% return
W(1) = 0;
    
    for i=2:N
        W(i) = W(i-1) + DW(i);
    end

    plot (n, W);
    hold on;
end
    