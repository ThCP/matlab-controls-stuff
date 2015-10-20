%% Signal Processing 
% Lab 01

% Exercise 3

close all, clear all, clc;

%% Data
A1 = 1;
A2 = 0.5;

N1 = 100;
N2 = 20;

N = 1000;

n = [0:1:N-1];

%% Step 1
x1 = A1*cos(2*pi/N1*n);
x2 = A2*cos(2*pi/N2*n);

figure('name', 'x1 x2');
plot(n, x1, 'k');
hold on;
plot(n, x2, 'r');
xlim([0, N-1]);
ylim([-2,2]);
xlabel('n');
legend('x1[n]', 'x2[n]');

%% Step 2
x = x1+x2;
figure('name', 'x');
plot(n, x, 'k');
xlim([0, N-1]);
ylim([-2,2]);
xlabel('n');
ylabel('x[n]');

%% Step 3
X = fft(x);

Xpos = X(1:N/2+1);
f = 1/N*(0:N/2);

Xabs = abs(Xpos);

figure('name', '|X(f)|');
plot (f,Xabs);
xlim([0, 0.5]);
axis tight;
xlabel('f');
ylabel('|X(f)|');


%% Step 4
figure(1);
print ('-dpng', 'x1_and_x2');

figure(2);
print ('-dpng', 'x');

figure(3);
print ('-dpng', 'X_abs');
