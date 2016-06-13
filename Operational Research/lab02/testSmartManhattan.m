%% 
function [sol_manhattan, topology] = testSmartManhattan(bij, trf_m)

arcs = generateArcs(trf_m, size(trf_m, 1)); 

[flow_matrix_bij, max_flow_bij] = route_by_shortest_path (bij, arcs, size(trf_m, 1), trf_m);

sol_manhattan = max_flow_bij;
topology = flow_matrix_bij;
