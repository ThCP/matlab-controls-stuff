%% Sliding window mean
% This function receives as input parameters the signal and the size of the
% sliding mean window, and returns an array which contains the values of
% the mean calculated using the given window size.

function [mu_est] = sliding_mean (X, Nw, Istep)
N = length (X);
mu_est = zeros(1,N);

switch nargin
    case 2
        ii = 1;
    case 3
        ii = Istep;
end

for n=0:ii:N-1
    n1 = (n-Nw/2);
    n2 = n+Nw/2;

    if(n1<0)
        n1=0;
    end

    if(n2>N-1)
        n2=N-1;
    end
    
    Xn = X(n1+1:n2);
    mu_est(n+1:n+ii)=ones(1,ii)*mean(Xn);  
end