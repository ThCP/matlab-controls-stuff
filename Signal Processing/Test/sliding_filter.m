%% Sliding filter 
% This function receives as input parameters the signal, the size of the
% sliding window used for mean and std.dev. and smooths the window by 
% eliminating the outliers, i.e. the values of the signal whose value is 
% larger than k*std_dev.

function [Xnew] = sliding_filter (X, Nw, k)
N = length (X);
Xnew = X;

for n=0:1:N-1 % start looping
    
    n1 = (n-Nw/2);
    n2 = n+Nw/2;

    if(n1<0)
        n1=0;
    end

    if(n2>N-1)
        n2=N-1;
    end

    Xn = X(n1+1:n2+1);
    
    mean_w = mean(Xn); % compute the mean on the window
    std_w = std(Xn); % compute the std dev on the window
    
    res = find((Xn>mean_w+k*std_w)|(Xn<mean_w-k*std_w)); % search for all
    % the values of Xn not belonging to the range we set (i.e. mu +-
    % k*std_dev)
    Xnew(res+n1) = mean_w; % assign to the outliers the value of the mean
    % this introduces a bias: the value of the outlier is way higher in abs
    % value than that of the average, so I am actually significantly
    % modifying the value of the mean. 
end
