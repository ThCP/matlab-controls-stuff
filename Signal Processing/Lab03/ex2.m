%% Signal Processing
% Lab 03

% Exercise 2

close all, clear all,clc;


%% Step 1
N = 100;

MAX_REPS = 50;

Ts = 1;
beta = 0.01;

n = [0:1:N-1];

for rep=1:MAX_REPS
    V = my_ornstein_uhlenbeck(N, Ts, beta);
    
    plot (n, V);
    hold on;
end

sigma_V = sqrt(1/(2*beta) * (1-exp(-2*beta*n)));
% figure;
plot (n, sigma_V,'ko');
plot (n, -sigma_V, 'ko');

%% Step 2
N = 100;

MAX_REPS = 5;

Ts = 1;
b1 = -5;
b2 = 1;
betas = logspace(b1,b2,5);

n = [0:1:N-1];
figure
for rep=1:MAX_REPS
    V = my_ornstein_uhlenbeck(N, Ts, betas(rep));
    
    % $$$$$$
%        legendInfo{i} = ['$$B = ' num2str(betas(i)) '$$'];
    % $$$$$$

    plot (n, V);
    hold on;
end

W = my_wiener_process(N, Ts);
plot (n, W, 'o-');
