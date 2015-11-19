%% Sliding window mean
% This function receives as input parameters the signal and the size of the
% sliding mean window, and returns an array which contains the values of
% the mean calculated using the given window size.

function [mu] = sliding_mean (X, Nw)
N = length (X);
mu = zeros(1,N);

for n=0:N-1
    n1 = n-Nw/2;
    n2 = n+Nw/2-1;
    
    if(n1<0)
        n1=0;
    end
    
    if(n2>N-1)
        n2=N-1;
    end
    
    Xn = X(n1+1:n2+1);
    mu(n+1) = mean(Xn);
end
