%% Wiener process theory

clear all, close all, clc;

samples = 1000;

N = 100; % number of repetitions
n = 1:samples;

Ts = 1;
% return
 hold on;
for o=1:N
    W = my_wiener_process(samples, Ts);
    plot (n, W);
   
end

variance = n;
std_dev = sqrt(variance);

plot (n, std_dev, 'ko');
plot (n, -std_dev, 'ko');
% return
%% Mesh graph of pdf+wiener
 Z=zeros(length(W));
% figure;
% plot3(n,W,Z);

% return
profile on
x = -samples:2:+samples-1;
f_W = 1./sqrt(2*pi*n) .* exp(-x.^2./(2*n));
figure
plot3(n, W, Z), hold on
xlabel('n');
ylabel('W');
% return
% figure
for nn=0:100:samples
% nn=1;
    f_W = 1./sqrt(2*pi*nn) .* exp(-x.^2./(2*nn));
    plot3(Z, x, f_W);
    Z=Z+100;
end
ylim([-100 +100])
profile viewer