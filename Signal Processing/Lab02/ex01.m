%% Signal Processing
% Lab 02

% Exercise 1
% Generation of nonstationary random processes defined as
% X[n] = sigma[n] * F[N] + mu[n] 

close all, clear all, clc;

% where F [n] is a discrete-time white Gaussian noise with zero mean and 
% unit variance, whereas sigma[n] and mu[n] are deterministic functions. 

% !!! NOTE: mu[n] is here called u[n] in order to avoid conflicts with the
% function mu(...). !!!


% !!! NOTE: sigma[n] is here called o[n] in order to avoid conflicts with the
% function sigma(...). !!!

MAX_LENGTH = 1000; % max number of points to sample

n = 1:1:MAX_LENGTH; % x-axis coordinate

%% Step 1
% Generate and plot M = 6 realizations of F [n]. Plot the realizations 
% on the same figure, by using the subplot function.

M = 6; 
figure;

for i=1:M
    F = randn (1,MAX_LENGTH);
    subplot(2,3,i);
    plot (n, F);
end

%% Step 2
% Take sigma[n]=1 and, by changing the function mu[n], generate a random 
% process X[n] with time-varying mean.

o = ones(1,MAX_LENGTH);
u = zeros(1,MAX_LENGTH);

% Linear mu
% mu changes linearly between mu1 and mu2 (arbitrarily chosen)
mu1 = 15; 
mu2 = 42;

u = linspace(mu1,mu2, MAX_LENGTH);

X = o .* F + u;
% subplot(3,1,1);
figure;
plot (n,X);
title('Linear mu');

% Piecewise constant mu
% mu is constant over an interval, but changes from an interval to another

clear u;

n_intervals = MAX_LENGTH/10; % arbitrarily decided
tot_len = 1;

while tot_len < MAX_LENGTH
    interval_length = round(randn(1)*(2*n_intervals+1)); % random inteval length with normal distribution
%     interval_length = round(rand()*(2*n_intervals+1)); % random inteval length with uniform distribution
    
    tot_len = tot_len + interval_length; 
    if (tot_len<1) % boundary check
        tot_len=1;
    end
    if (tot_len > MAX_LENGTH) % exit the loop when the last position is reached
        interval_length = -MAX_LENGTH + tot_len;
        tot_len = MAX_LENGTH;
        val = rand()*50 ;
        u(tot_len-interval_length:tot_len) = val;
        break;
    end
    val = rand()*10;
    u(tot_len-interval_length:tot_len) = val;
end

X = o .* F + u;

% plot (n, mu, 'o');
% subplot(3,1,2);mu
figure;
plot (n, X);      
title('piecewise continuous mu');
axis tight

% Cyclic mu
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

% plot (n, mu, '-');
% subplot(3,1,3);
figure;
plot (n, X);   
title('cyclic mu');

%% Step 3
% Take mu[n]=1 and, by changing sigma[n], generate a random process with 
% time-varying variance. 

u = ones(1,MAX_LENGTH);

o = ones(1,MAX_LENGTH);

% Linear sigma
% sigma changes linearly between mu1 and mu2
sigma1 = 0; 
sigma2 = 42;

o = linspace(sigma1,sigma2, MAX_LENGTH);

X = o .* F + u;
% subplot(3,1,1);
figure;
plot (n,X);
title('linear sigma');

% Piecewise constant sigma
% sigma is constant over an interval, but changes from an interval to another

clear o;

n_intervals = MAX_LENGTH/10;
tot_len = 1;

while tot_len < MAX_LENGTH
    interval_length = round(randn(1)*(2*n_intervals+1)); % random inteval length with normal distribution
%     interval_length = round(rand()*(2*n_intervals+1)); % random inteval length with uniform distribution

    tot_len = tot_len + interval_length ;           
    if (tot_len<1)
        tot_len=1;
    end
    if (tot_len > MAX_LENGTH)
        interval_length = -MAX_LENGTH + tot_len;
        tot_len = MAX_LENGTH;
        val = rand()*10;
        o(tot_len-interval_length:tot_len) = val;
        break;
    end
    val = rand()*10;
    o(tot_len-interval_length:tot_len) = val;
end

X = o .* F + u;

% plot (n, mu, 'o');
% subplot(3,1,2);
figure;
plot (n, X);      
title('piecewise constant sigma');

% Cyclic sigma
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

% plot (n, mu, '-');
figure;
% subplot(3,1,3);
plot (n, X);   
title('cyclic sigma');