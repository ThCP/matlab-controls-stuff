%% Random walk generator with Wiener processes
% This function receives as parameters the number of steps N of the random
% walk and the sampling time Ts. It returns an array which contains the
% coordinate corresponding to the given time instant.

% The discretization of a Wiener process is given by the following:
% W[n] = W[n-1]+DW[n]
% W[0] = 0
% DW[n] ~ N(0,Ts)

function W =random_walk_wiener (N, Ts)

n = [0:1:N-1];

DW = random ('norm', 0, Ts, 1, N);

W = zeros(1,N);
% return
W(1) = 0;
    
for i=2:N
    W(i) = W(i-1) + DW(i);
end
% 
% plot (n, W);