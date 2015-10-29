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
DV = random ('norm', 0, (1/(2*beta)*(1-exp(-2*beta*Ts)))^(1/2), 1, N); 

V = zeros(1,N);
V(1) = 0;
    
    for i=2:N
        V(i) = V(i-1)*exp(-beta*Ts) + DV(i);
    end

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
DV = random ('norm', 0, (1/(2*betas(rep))*(1-exp(-2*betas(rep)*Ts)))^(1/2), 1, N); 

V = zeros(1,N);
V(1) = 0;
    
    for i=2:N
        V(i) = V(i-1)*exp(-betas(rep)*Ts) + DV(i);
    end

    plot (n, V);
    hold on;
end
return
sigma_V = sqrt(1/(2*beta) * (1-exp(-2*beta*n)));
% figure;
plot (n, sigma_V,'ko');
plot (n, -sigma_V, 'ko');
