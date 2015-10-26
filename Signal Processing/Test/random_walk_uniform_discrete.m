%% Random walk generator, uniform distribution, discrete steps
% This function receives as parameters the number of steps N of the random
% walk and the sampling time Ts. It returns an array which contains the
% coordinate corresponding to the given time instant.

% The discretization of this process is given by the following:
% X[n] = X[n-1]+DX[n]
% X[0] = 0
% DX[n] ~ U(0,1)

function X = random_walk_uniform_discrete (N, Ts)

close all;

n = [0:1:N-1];

DX = round(random ('unif', 0, 1, 1, N));

X = zeros(1,N);
% return
X(1) = 0;
    
for i=2:N
    if (DX(i) == 0)
        DX(i) = -1;
    end
    X(i) = X(i-1) + DX(i);
end
% 
plot (n, X);