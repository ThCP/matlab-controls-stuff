%% 2d Wiener processes

close all, clear all, clc;

N = 250000;

Ts = 1;

n = [0:1:N-1];

DW = random ('norm', 0, Ts, 2, N);

W = zeros(2,N);

    
for i=2:N
    W(1,i) = W(1,i-1) + DW(1,i);
    W(2,i) = W(2,i-1) + DW(2,i);
end

plot (W(1,:), W(2,:));
legend('Wiener process');