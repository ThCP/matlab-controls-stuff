%% Test Kalman filter

clear all, close all, clc;

%% Data
N = 1000;
Ts = 1;
beta = 0.1;
ux = 1;
uy = 1;

F = [ 0 1 0 0 ; 0 -beta 0 0 ; 0 0 1 0 ; 0 0 -beta 0 ];
u = [ 0 ux 0 uy ];

H = [1 0 0 0 ; 0 0 1 0];

eta = random ('norm', 0, 0.01, 4, N);
b = 1; 

%% System model equation
% x[n] = phi*x[n-1] + eta[n-1] + b*u[n-1]

% z[n] = H*x[n] + v[n]

phi = expm(F*Ts);

%% Simulation of boat
x(:,1) = [ 0 0 0 0 ];

for i=2:N
    x(:,i) = F*x(:,i-1) + eta(:,i-1) + b .* u';
end

plot(x(1,:), x(3,:));