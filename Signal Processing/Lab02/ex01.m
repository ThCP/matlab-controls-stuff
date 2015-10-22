%% Signal Processing
% Lab 02

% Exercise 1

close all, clear all, clc;

% X[n] = sigma[n] * F[N] + mu[n] DEFINITION OF X[n]

MAX_LENGTH = 100;

n = [1:1:MAX_LENGTH];

M = 5;

%% Step 1
figure;

for i=1:M
    F = randn (1,MAX_LENGTH);
    subplot(2,3,i);
    plot (n, F);
end

%% Step 2
figure;

sigma = ones(1,MAX_LENGTH);
mu = zeros(1,MAX_LENGTH);

X = sigma .* F + mu;

% Linear mu
% mu changes linearly between mu1 and mu2
mu1 = 15; 
mu2 = 42;

mu = linspace(mu1,mu2, MAX_LENGTH);

X = sigma .* F + mu;
subplot(3,1,1);
plot (n,X);

% Piecewise constant mu
% mu is constant over an interval, but changes from an interval to another

clear mu;

n_intervals = 10;
tot_len = 1;

while tot_len < MAX_LENGTH
    interval_length = round(rand()*(2*n_intervals+1));
    tot_len = tot_len + interval_length            
    if (tot_len > MAX_LENGTH)
        interval_length = -MAX_LENGTH + tot_len;
        tot_len = MAX_LENGTH;
        val = rand()*10;
        mu(tot_len-interval_length:tot_len) = val;
        break;
    end
    val = rand()*10;
    mu(tot_len-interval_length:tot_len) = val;
end

X = sigma .* F + mu;

% plot (n, mu, 'o');
subplot(3,1,2);
plot (n, X);      

% Cyclic mu
% mu is a sinusoid which oscillates between two arbitrary values mu1 and
% mu2

mu1 = 12; 
mu2 = 23;

A = abs(mu1-mu2);
bias = (mu1+mu2)/2;

N = 10;

clear mu;
mu = A * cos ( 2*pi/N*n ) + bias;

X = sigma .* F + mu;

% plot (n, mu, '-');
subplot(3,1,3);
plot (n, X);   

%% Step 3
figure
mu = ones(1,MAX_LENGTH);

sigma = ones(1,MAX_LENGTH);

X = sigma .* F + mu;

% Linear sigma
% sigma changes linearly between mu1 and mu2
sigma1 = 15; 
sigma2 = 42;

sigma = linspace(sigma1,sigma2, MAX_LENGTH);

X = sigma .* F + mu;
subplot(3,1,1);
plot (n,X);

% Piecewise constant sigma
% sigma is constant over an interval, but changes from an interval to another

clear sigma;

n_intervals = 10;
tot_len = 1;

while tot_len < MAX_LENGTH
    interval_length = round(rand()*(2*n_intervals+1));
    tot_len = tot_len + interval_length            
    if (tot_len > MAX_LENGTH)
        interval_length = -MAX_LENGTH + tot_len;
        tot_len = MAX_LENGTH;
        val = rand()*10;
        sigma(tot_len-interval_length:tot_len) = val;
        break;
    end
    val = rand()*10;
    sigma(tot_len-interval_length:tot_len) = val;
end

X = sigma .* F + mu;

% plot (n, mu, 'o');
subplot(3,1,2);
plot (n, X);      

% Cyclic sigma
% sigma is a sinusoid which oscillates between two arbitrary values sigma1 and
% sigma2

sigma1 = 12; 
sigma2 = 23;

A = abs(sigma1-sigma2);
bias = (sigma1+sigma2)/2;

N = 10;

clear sigma;
sigma = A * cos ( 2*pi/N*n ) + bias;

X = sigma .* F + mu;

% plot (n, mu, '-');
subplot(3,1,3);
plot (n, X);   