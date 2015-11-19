%% Lab 04 step 3
% Simulate the three nonstationary random processes with time-varying mean 
% value and constant variance generated in Sects. 2.1-2.3 of the 
% second laboratory.

clear all, close all, clc;

N = 10000;

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
legend ('X', 'mu_{est}', 'mu_{true}');

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
legend ('X', 'mu_{est}', 'mu_{true}');
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
legend('X', 'mu_{est}', 'mu_{true}');

