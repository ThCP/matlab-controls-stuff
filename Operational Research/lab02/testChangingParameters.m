%% test with parameters

function [fig, res] = testChangingParameters(check, probability, n_tries, n_delta, scenarios, number_nodes, matrices)

min_flows_array = zeros(3,scenarios);
connected_array = zeros(3,scenarios);


for ii = 1:scenarios
%     clc;
%     s = sprintf('*%.0f*', ii);
%     disp(s);
    
    if nargin == 7
        trf_m = matrices(:,:,ii);
    else
    trf_m = 0.5 + rand(number_nodes,number_nodes);
%     trf_m = genBlockMatrix(20);
    end
    [min_flows, max_flows, avg_flows, connected] = test_multiple_times_multiple_params(trf_m,check, probability, n_tries, n_delta, 'Uniform traffic 20x20', 0);
%     max_flows_array(:,ii) = max_flows;
    min_flows_array(:,ii) = min_flows;
%     avg_flows_array(:,ii) = avg_flows;
    connected_array(:,ii) = connected;
end

%%
min_avg_rand = mean(min_flows_array(1,:));
min_avg_algo = mean(min_flows_array(2,:));
min_avg_scom = mean(min_flows_array(3,:));

res = sprintf('Average random = %.6f Average algorithm = %.6f Average scom = = %.6f', ...
    min_avg_rand, min_avg_algo, min_avg_scom);

disp(res);

%%

s = sprintf('%.0fx%.0f traffic matrix, n_{delta} = %.0f, p = %.1f, K = %.0f', number_nodes,...
    number_nodes, n_delta, probability, check);


%%
fig = figure;
plot(1:scenarios, min_flows_array(1,:), 'b', 1:scenarios, min_flows_array(2,:), 'r', 1:scenarios, min_flows_array(3,:), 'k');
xlabel('Trial number', 'FontSize', 20);
ylabel('Flow', 'FontSize', 20);
title(s, 'FontSize', 18);
hold on
plot(1:scenarios, ones(scenarios,1)*min_avg_rand, 'b:');
plot(1:scenarios, ones(scenarios,1)*min_avg_algo, 'r:');
plot(1:scenarios, ones(scenarios,1)*min_avg_scom, 'k:');
% , 1:50, ones(1,50)*avg_algo, 'r-', ones(1,50)*avg_scom, 'b-' );
l = legend('random', 'algorithm', 'scom');
set (l, 'FontSize', 10);

id_random = find(connected_array(1,:)==0);
id_algo =   find(connected_array(2,:)==0);
id_scom =   find(connected_array(3,:)==0);

plot (id_random, min_flows_array(1,id_random), 's', 'MarkerSize',12, 'MarkerEdgeColor','b');
plot (id_algo, min_flows_array(2,id_algo), 'x', 'MarkerSize',12, 'MarkerEdgeColor','b');
plot (id_scom, min_flows_array(3,id_scom), 's', 'MarkerSize',12, 'MarkerEdgeColor','b');

% fig = figure(1);
