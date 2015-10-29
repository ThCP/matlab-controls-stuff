%% Signal Processing
% Lab 03

% Exercise 2

close all, clear all,clc;


%% Step 1
% Generate M = 50 realizations of the Ornstein-Uhlenbeck process of N = 100 
% samples each, with = 0:01 and Ts = 1. Plot the realizations in the same 
% figure, and superimpose the two curves V (t), where V (t) is the 
% theoretical standard deviation of V (t). 

N = 100; % n of samples

MAX_REPS = 50;

Ts = 1;
beta = 0.01;

n = 0:1:N-1;

for rep=1:MAX_REPS
    V = my_ornstein_uhlenbeck(N, Ts, beta);
    
    plot (n, V);
    hold on;
end

sigma_V = sqrt(1/(2*beta) * (1-exp(-2*beta*n))); % std. deviation of V
% figure;
plot (n, sigma_V,'ko');
plot (n, -sigma_V, 'ko');

%% Step 2
% Generate M = 5 realizations of the Ornstein-Uhlenbeck process by changing 
% between two arbitrary values beta1 and beta2. Choose a large beta1 and a 
% small beta2 , to highlight the transition from the Ornstein-Uhlenbeck 
% process to the Wiener process, which corresponds to beta = 0.

N = 100;

MAX_REPS = 5;

Ts = 1;
b1 = -5;
b2 = 1;
betas = logspace(b1,b2,MAX_REPS); % I generate an array of log. spaced betas

n = 0:1:N-1;
figure
for rep=1:MAX_REPS
    V = my_ornstein_uhlenbeck(N, Ts, betas(rep));
    
    % $$$$$$
       legendInfo{rep} = ['$$B = ' num2str(betas(rep)) '$$'];
    % $$$$$$

    plot (n, V);
    hold on;
end

W = my_wiener_process(N, Ts);
plot (n, W, 'o-');
my_legend(legendInfo, 12);