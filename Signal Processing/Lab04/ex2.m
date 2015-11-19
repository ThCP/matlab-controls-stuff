%% Lab 04
% Exercise 2

clear all, close all, clc;

%% step 2

N = 10000;
F = randn(1,N);

mu_est = sliding_mean (F, 500);

n = 0:1:N-1;

mu_F = zeros(1,N);

plot (n, F, n, mu_est, n, mu_F);
% legend ('mu_{est}', 'F', 'mu_F');
title('White Gaussian Noise');


%% step 3
% Simulate the three nonstationary random processes with time-varying mean 
% value and constant variance generated in Sects. 2.1-2.3 of the 
% second laboratory.

o = ones(1,N);
u = zeros(1,N);

%% Linear mu
mu1 = 15; 
mu2 = 42;

u = linspace(mu1,mu2, N);

X = o .* F + u;

mu_est = sliding_mean (X, 500);
mu_true = mean(X);

figure;
plot (n,X, n, mu_est, n, mu_true);
title('Linear mu');
% legend ('X', 'mu_{est}', 'mu_{true}');

%% Piecewise constant mu
% mu is constant over an interval, but changes from an interval to another

clear u;

n_intervals = N/10; % arbitrarily decided
tot_len = 1;

while tot_len < N
    interval_length = round(randn(1)*(2*n_intervals+1)); % random inteval 
                                        % length with normal distribution
    
    tot_len = tot_len + interval_length; 
    if (tot_len<1) % boundary check
        tot_len=1;
    end
    if (tot_len > N) % exit the loop when the last position is reached
        interval_length = -N + tot_len;
        tot_len = N;
        val = rand()*50 ;
        u(tot_len-interval_length:tot_len) = val;
        break;
    end
    val = rand()*10;
    u(tot_len-interval_length:tot_len) = val;
end

X = o .* F + u;

mu_est = sliding_mean (X, 500);
mu_true = mean(X);

figure;
plot (n,X, n, mu_est, n, mu_true);
% legend ('X', 'mu_{est}', 'mu_{true}');
title('piecewise continuous mu');

%% Cyclic mu
% mu is a sinusoid which oscillates between two arbitrary values mu1 and
% mu2

mu1 = 5; 
mu2 = 15;

A = abs(mu1-mu2); % find the amplitude
bias = (mu1+mu2)/2; % find the middle point

T = 200; % oscillation period

clear u;
u = A * cos ( 2*pi/T*n ) + bias;

X = o .* F + u;

mu_est = sliding_mean (X, 500);
mu_true = mean(X);

figure;
plot (n,X, n, mu_est, n, mu_true);
title('cyclic mu');
% legend('X', 'mu_{est}', 'mu_{true}');

%% Step 3b
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
% legend('X', 'mu_{est}', 'mu_{true}');


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
% legend('X', 'mu_{est}', 'mu_{true}');


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
% legend('X', 'mu_{est}', 'mu_{true}');
