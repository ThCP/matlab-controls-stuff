%% 2d Wiener processes

close all, clear all, clc;

N = 25000; % number of steps

Ts = 1; % sampling time

n = [0:1:N-1]; % sampling array

DW = random ('norm', 0, Ts, 2, N); % produce an array of randomly distributed variations

W = zeros(2,N); % initalization
    
for i=2:N
    W(1,i) = W(1,i-1) + DW(1,i); % variation in the x direction
    W(2,i) = W(2,i-1) + DW(2,i); % variation in the y direction
end

plot (W(1,:), W(2,:));
legend('Wiener process');
