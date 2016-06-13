%% Gen plot performance
% This is one of the last test scripts. Here we test the algorithm against
% a randomly generated topology as well as a topology generated according
% to SCOM. 
% We generate multiple traffic matrices and then we extract the mean of the
% minimium flow 

clc, close all, clear all;
%%
% test values
check = 3;
probability = 0.7;
n_tries = 5;
n_delta = 2;
experiment = '';
scenarios = 50;
number_nodes = 20;

% declaration of arrays
min_flows_array = zeros(3, scenarios);
connected_array = zeros(3, scenarios);


%% 40x40

for ii = 1:scenarios
    s = sprintf('*%.0f*', ii);
    disp(s);
    trf_m = 0.5 + rand(number_nodes,number_nodes);
%     trf_m = genBlockMatrix(number_nodes);

    [min_flows, max_flows, avg_flows, connected] = test_multiple_times_multiple_params(trf_m,check, probability, n_tries, n_delta, 'Uniform traffic 20x20', 0);
    min_flows_array(:,ii) = min_flows;
    connected_array(:,ii) = connected;
end

% return;
%%
min_avg_rand = mean(min_flows_array(1,:));
min_avg_algo = mean(min_flows_array(2,:));
min_avg_scom = mean(min_flows_array(3,:));

%%
plot(1:scenarios, min_flows_array(1,:), 'b', 1:scenarios, min_flows_array(2,:), 'r', 1:scenarios, min_flows_array(3,:), 'k');
xlabel('Trial number', 'FontSize', 20);
ylabel('Flow', 'FontSize', 20);
title('20x20 uniform traffic matrix, n_{delta} = 4', 'FontSize', 22);
hold on
plot(1:scenarios, ones(scenarios,1)*min_avg_rand, 'b:');
plot(1:scenarios, ones(scenarios,1)*min_avg_algo, 'r:');
plot(1:scenarios, ones(scenarios,1)*min_avg_scom, 'k:');
% , 1:50, ones(1,50)*avg_algo, 'r-', ones(1,50)*avg_scom, 'b-' );
l = legend('random', 'algorithm', 'scom');
set (l, 'FontSize', 20);

id_random = find(connected_array(1,:)==0);
id_algo =   find(connected_array(2,:)==0);
id_scom =   find(connected_array(3,:)==0);

plot (id_random, min_flows_array(1,id_random), 's', 'MarkerSize',12, 'MarkerEdgeColor','b');
plot (id_algo, min_flows_array(2,id_algo), 'x', 'MarkerSize',12, 'MarkerEdgeColor','b');
plot (id_scom, min_flows_array(3,id_scom), 's', 'MarkerSize',12, 'MarkerEdgeColor','b');


beep