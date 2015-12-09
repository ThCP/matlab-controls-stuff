%% Network probing
close all, clear all, clc;
data = load('output4');

txrate = data(:,1);
rxrate = data(:,2);

samples = 0:length(data)-1;

plot (samples, txrate, samples, rxrate);

average_tx = sliding_mean(txrate, 100);

hold on
plot (samples, average_tx);

average_rx = sliding_mean(rxrate, 100);
plot (samples, average_rx);
legend ('txrate', 'rxrate', 'tx_{average}','rx_{average}');
