%% experiment1 part 2
m = load('matlab.mat');

rho_diff1 = m.rho_diff;
rho_same1 = m.rho_same;

rho1 = [rho_diff1 rho_same1];

metric_same = m.metric;
metric_diff1 = m.metric_diff;

std_same = std(rho_same1)
avg_same = mean(rho_same1)

std_diff = std(rho_diff1)
avg_diff = mean(rho_diff1)

n = -0.01:0.001:0.2;
figure, hist(rho1, n)