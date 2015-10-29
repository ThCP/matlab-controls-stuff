%% Signal Processing
% Lab 03

% Exercise 1

close all, clear all,clc;


%% Step 1
% Generate M = 5 realizations of the discrete-time Wiener process W [n]. 
% Each realization must be made by N = 1000 samples, with a sampling time 
% Ts = 1. Plot the realizations on the same figure.

N = 1000; % number of samples

MAX_REPS = 50; % n of processes to create

Ts = 1; % sampling time

n = 0:1:N-1;

for rep=1:MAX_REPS
    W = my_wiener_process(N, Ts); 
    
    plot (n, W);
    hold on;
end

sigma_W = sqrt(n);
plot (n, sigma_W,'k');
plot (n, -sigma_W, 'k');

%% Step 2
% By simulating a large number of realizations, estimate the probability 
% density f_W (x; t) of the Wiener process at some time instants chosen at 
% will. Use the function hist to estimate the probability density.

N = 1000;

MAX_REPS = 10000;

Ts = 1;

n = 0:1:N-1;

T1 = zeros(1, MAX_REPS); % Values of the computed Wiener processes at time t0
T2 = zeros(1, MAX_REPS); % Values of the computed Wiener processes at time t1

t1 = 50;
t2 = 500;

for rep=1:MAX_REPS
    W = my_wiener_process(N, Ts);

    T1(rep) = W(t1);
    T2(rep) = W(t2);
end

% Plot values taken at time t0
bins = min(T1):1:max(T1); % I generate an array with equispaced values between
                          % the min and the max value.
% NOTE: if the intervals are not equispaced I need to normalize the
% gaussian pdf I generate below. This is the case when I use hist with a
% single number of bins instead of an array which defines the width of the
% bins themselves.
                        

[N1, X1] = hist (T1,bins); % I use the data gathered by the hist funct and I 
                         % use them to plot the estimated pdf 
figure
plot(X1, N1); 

hold on;

% Plot values taken at time t1
bins = min(T2):1:max(T2);
[N2, X2] = hist (T2,bins);
plot(X2, N2);
legend ('T1', 'T2');


%% Step 3
% Plot the estimated probability densities on the same figure, to 
% highlight the increase in variance of the Gaussian probability density 
% function of W (t).

% at time t0
N1sum = sum(N1); % I normalize the values in order to integrate to 1
N1norm = N1/N1sum;

Y_dist = normpdf(X1, 0, sqrt(t1)); % Var(W[n]) = t

% Y_dist = Y_dist/sum(Y_dist); 
% This line of code is needed in case the intervals in the vector X1 are 
% not equispaced. In such a case the sum of the pdf is not 1 and so I need 
% to normalize it. 
figure; plot (X1, N1norm, X1, Y_dist);
legend ('Statistical distribution', 'Theoretical distribution');

% at time t1;
N2sum = sum(N2); % I normalize the values in order to integrate to 1
N2norm = N2/N2sum;

Y_dist = normpdf(X2, 0, sqrt(t2));
% Y_dist = Y_dist/sum(Y_dist); 

figure; plot (X2, N2norm, X2, Y_dist);
legend ('Statistical distribution', 'Theoretical distribution');
