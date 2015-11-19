%% Sliding window std dev
% This function receives as input parameters the signal, the size of the
% sliding std dev window and the step length.
% It then returns an array which contains the values of the std dev calculated 
% using the given window size.

function [std_est] = sliding_std (X, Nw, Istep)
N = length (X);
std_est = ones(1,N);

switch nargin % check the number of arguments
    case 2
        ii = 1; % no Istep present
    case 3
        ii = Istep; % set the correct Istep
end

for n=0:ii:N-1 % start looping
    n1 = (n-Nw/2);
    n2 = n+Nw/2;

    if(n1<0)
        n1=0;
    end

    if(n2>N-1)
        n2=N-1;
    end

    Xn = X(n1+1:n2); % This is the window
    std_est(n+1:n+ii)=ones(1,ii)*std(Xn); % set the std value to the current step  
end
