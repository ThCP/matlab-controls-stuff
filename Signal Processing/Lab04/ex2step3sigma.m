%% Exercise 2 step 3b

clear all, close all, clc;

N = 10000;

% Take mu[n]=1 and, by changing sigma[n], generate a random process with 
% time-varying variance. 

u = ones(1,N);
o = ones(1,N);

%% Linear sigma
% sigma changes linearly between mu1 and mu2
sigma1 = 0; 
sigma2 = 42;

o = linspace(sigma1,sigma2, N);

X = o .* F + u;

mu_est = sliding_mean (X, 500);
mu_true = mean(X);

figure;
plot (n,X, n, mu_est, n, mu_true);
title('linear sigma');
legend('X', 'mu_{est}', 'mu_{true}');


%% Piecewise constant sigma
% sigma is constant over an interval, but changes from an interval to another

clear o;

n_intervals = N/10;
tot_len = 1;

while tot_len < N
    interval_length = round(randn(1)*(2*n_intervals+1)); % random inteval length with normal distribution
%     interval_length = round(rand()*(2*n_intervals+1)); % random inteval length with uniform distribution

    tot_len = tot_len + interval_length ;           
    if (tot_len<1)
        tot_len=1;
    end
    if (tot_len > N)
        interval_length = -N + tot_len;
        tot_len = N;
        val = rand()*10;
        o(tot_len-interval_length:tot_len) = val;
        break;
    end
    val = rand()*10;
    o(tot_len-interval_length:tot_len) = val;
end

X = o .* F + u;

mu_est = sliding_mean (X, 500);
mu_true = mean(X);

figure;
plot (n, X, n, mu_est, n, mu_true);      
title('piecewise constant sigma');
legend('X', 'mu_{est}', 'mu_{true}');


%% Cyclic sigma
% sigma is a sinusoid which oscillates between two arbitrary values sigma1 and
% sigma2

sigma1 = 12; 
sigma2 = 23;

A = abs(sigma1-sigma2);
bias = (sigma1+sigma2)/2;

T = 200;

clear o;
o = A * cos ( 2*pi/T*n ) + bias;

X = o .* F + u;

mu_est = sliding_mean (X, 500);
mu_true = mean(X);

figure
plot (n, X, n, mu_est,n, mu_true);   
title('cyclic sigma');
legend('X', 'mu_{est}', 'mu_{true}');
