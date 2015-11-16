%% Sliding window std dev
% This function receives as input parameters the signal and the size of the
% sliding std window, and returns an array which contains the values of
% the std deviation calculated using the given window size.

function [mu] = sliding_std (X, Nw, Istep)
N = length (X);
% mu = zeros(1,N);

switch nargin
    case 2
        ii = 1;
    case 3
        ii = Istep;
end
c=0;
for n=0:ii:N-1
    
% for n=0:N-1
    n1 = (n-Nw/2);
    n2 = n+Nw/2;

%     n1 = (n+ii-Nw/2);
%     n2 = n+ii+Nw/2;


    if(n1<0)
        n1=0;
    end

    if(n2>N-1)
        n2=N-1;
    end

    Xn = X(n1+1:n2+1);
    mu(c+1) = std(Xn);
    c=c+1;
%     mu(n+1) = mean(Xn);
    
end
