%% Plot mean vs signal
% This function receives as input parameters the signal and the size of the
% sliding mean window and plots the corresponding signal and its mean on
% the same graph.

function plot_mean_signal (signal, window)

n = 1:1:length(signal);

mean_value = sliding_mean(signal, window);

figure ('name', 'Signal and mean');
plot(n, signal, n, mean_value);
legend('X[n]', 'mu[n]');


