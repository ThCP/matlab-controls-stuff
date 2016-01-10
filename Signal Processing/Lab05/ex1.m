%% Lab 05 
% ex 01

close all, clear all, clc;

%% step 1
finn = fopen('AtomicClock.txt');
data = fscanf(finn, '%f');
fclose(finn);

Nw = 100;
Istep = 1;

mu_data = sliding_mean(data,Nw, Istep);

n1 = 0:1:length(data)-1;
n2 = 0:Istep:Istep*length(mu_data)-1;
%% step 2 
plot (n1, data, n2, mu_data);
title('mu_{data}');

%% step 3
std_data = sliding_std(data,Nw, Istep);
figure
plot (n2, std_data);
title('std_{data}');
%% step 5
s1 = mu_data + 2 * std_data;
s2 = mu_data - 2 * std_data;

figure
plot(n1, data); hold on;
plot(n2, s1);
plot(n2, mu_data);
plot(n2, s2);

%% outlier filter
Xnew = sliding_filter(data, Nw, 3);
figure;
plot (0:1:length(Xnew)-1, Xnew);

%% stessacosasullastandarddeviascion
stdnew = sliding_filter(std_data, 1000, 2);
figure;
plot (0:1:length(stdnew)-1, stdnew);

P = polyfit(0:1:length(stdnew)-1, stdnew, 5);
y1 = polyval(P, 0:1:length(stdnew)-1);
hold on, plot (0:1:length(stdnew)-1, y1);