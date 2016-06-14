%% testSCOM
% [sol_scom] = testSCOM (trf_m, number_nodes, n_delta)
% This function returns the maxflow found in a topology generated according
% to the SCOM algorithm. This is done by using the script for our algorithm
% and setting the value of K to a very large number. The result is ignoring
% the random choice altogether. This means that the topology and the value
% of max_flow are constant for every trf_m. 


function [sol_SCOM, topology] = testSCOM(trf_m, number_nodes, n_delta)

p = 0;
n_check = 10000000;

[bij, arcs] = generate_flow_matrix(number_nodes, n_delta, p, n_check, trf_m);
[flow_matrix_bij, max_flow_bij] = route_by_shortest_path (bij, arcs, number_nodes, trf_m);

sol_SCOM = max_flow_bij;
topology = flow_matrix_bij;
