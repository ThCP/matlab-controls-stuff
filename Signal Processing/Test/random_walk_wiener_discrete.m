%% Random walk generator with Wiener processes, discrete steps
% This function receives as parameters the number of steps N of the random
% walk and the sampling time Ts. It returns an array which contains the
% coordinate corresponding to the given time instant. 
% Steps are now discrete (the values are rounded to the closest integer).

% The discretization of a Wiener process is given by the following:
% W[n] = W[n-1]+DW[n]
% W[0] = 0
% DW[n] ~ N(0,Ts)

function W =random_walk_wiener_discrete (N, Ts)

close all;

n = [0:1:N-1];

DW = round (random ('norm', 0, Ts, 1, N) );

W = zeros(1,N);
% return
W(1) = 0;
    
for i=2:N
    W(i) = W(i-1) + DW(i);
end
% 
plot (n, W);