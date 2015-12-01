%% Lab 07 ex 1
% Simulating the motion of a boat
% x[n] = phi * x[n-1] + b[n-1] + eta[n-1]

clear all, close all, clc;

%% Data
PHI = [1 0.6321 0 0; 0 0.3679 0 0; 0 0 1 0.6321; 0 0 0 0.3679];
b = [0.3679 0.6321 0.3679 0.6321].';
Q = [0.0168 0.0200 0 0 ; 0.02 0.0432 0 0 ; 0 0 0.0168 0.02 ; 0 0 0.02 0.0432 ];

N = 1000;

x(:,1) = [ 0 0 0 0 ]; % initial conditions

%% True trajectory
for i=2:N
    u = zeros(4,1);
    eta = mvnrnd(u, 10*Q);
    x(:,i) = PHI*x(:,i-1) + eta.' + b ;
end
% 
% plot(x(1,:), x(3,:));

%% Measured trajectory
% z[n] = H * x[n] + v[n]
H = [1 0 0 0; 0 0 1 0];
r = 10;
R = r * [ 1 0 ; 0 1 ];

v  = sqrt(r) * randn(2,N);
x_meas = zeros (4,N);
for i=1:N
    z(:,i) = H * x(:,i) + v(:,i);
end


figure
plot(x(1,:), x(3,:), 'r'); hold on
plot(z(1,:), z(2,:));

%% Filter application

% initial conditions
x_filter = zeros(4,N);
Pnp = zeros(4);
xenp = x_filter(:,1);

for i = 2:N
    zn = z(:,i);
    xen_1p = x_filter(:,i-1);
    Pn_1p = Pnp;
    H;
    R;
    PHI;
    Q;
    bn_1 = b;
    [xenp, Pnp] = my_kalman(zn, xen_1p, Pn_1p, H, R, PHI, Q, bn_1);
    x_filter(:, i) = xenp;
end

% figure
plot(x_filter(1,:), x_filter(3,:), 'k');
title('kalman filter');
legend('real trajectory', 'measured trajectory', 'filtered value');
