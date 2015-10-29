%% Signal Processing
% Lab 03

% Exercise 1

close all, clear all,clc;


%% Step 1
N = 1000;

MAX_REPS = 5;

Ts = 1;

n = [0:1:N-1];

for rep=1:MAX_REPS
    W = my_wiener_process(N, Ts);
    
    plot (n, W);
    hold on;
end

sigma_W = sqrt(n);
plot (n, sigma_W,'k');
plot (n, -sigma_W, 'k');

%% Step 2

N = 1000;

MAX_REPS = 10000;

Ts = 1;

n = [0:1:N-1];

T0 = zeros(1, MAX_REPS); % Values of the computed Wiener processes at time t0
T1 = zeros(1, MAX_REPS); % Values of the computed Wiener processes at time t1

t0 = 50;
t1 = 500;

for rep=1:MAX_REPS
    W = my_wiener_process(N, Ts);

    T0(rep) = W(t0);
    T1(rep) = W(t1);
end

% bins = 50;

bins = min(T0):1:max(T0);

[N1, X1] = hist (T0,bins); % I use the data gathered by the hist funct and I 
                         % use them to plot the estimated pdf 
figure
plot(X1, N1); hold on;
% bins = linspace(min(T1), max(T1), (max(T1)-min(T1)));
bins = min(T1):1:max(T1);
[N2, X2] = hist (T1,bins);
plot(X2, N2);
legend ('T0', 'T1');


%% Step 3
% at time t0
N1s = sum(N1); % I normalize the values in order to integrate to 1
N1n = N1/N1s;

figure; plot(X1, N1n), hold on;

Y_dist = normpdf(X1, 0, sqrt(t0));
% return
% Y_dist = Y_dist/sum(Y_dist); % I normalize again to integrate to 1
plot (X1, Y_dist);

% at time t1;
N2s = sum(N2); 
N2n = N2/N2s;

figure; plot(X2, N2n), hold on;

Y_dist = normpdf(X2, 0, sqrt(t1));
% return
% Y_dist = Y_dist/sum(Y_dist); 
plot (X2, Y_dist);

