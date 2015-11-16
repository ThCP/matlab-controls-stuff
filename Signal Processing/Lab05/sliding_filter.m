%% Sliding filter 
% This function receives as input parameters the signal and the size of the
% sliding mean window and smooths the window by eliminating the outliers.

function [Xnew] = sliding_filter (X, Nw, k)
N = length (X);
Xnew = X;

for n=0:1:N-1
    
    n1 = (n-Nw/2);
    n2 = n+Nw/2;

    if(n1<0)
        n1=0;
    end

    if(n2>N-1)
        n2=N-1;
    end

    Xn = X(n1+1:n2+1);
    
    mean_w = mean(Xn);
    std_w = std(Xn);
    
    res = find((Xn>mean_w+k*std_w)|(Xn<mean_w-k*std_w));
    Xnew(res+n1) = mean_w;
end
