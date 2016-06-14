%%  testSmartManhattan
% [sol_manhattan, topology] = testSmartManhattan(bij, trf_m)
% This returns the maxflow given a smart manhattan topology. Both the
% traffic matrix and the generated topology are passed as inputs (unlike
% all the other tests).

function [sol_manhattan, topology] = testSmartManhattan(bij, trf_m)

arcs = generateArcs(trf_m, size(trf_m, 1)); 

[flow_matrix_bij, max_flow_bij] = route_by_shortest_path (bij, arcs, size(trf_m, 1), trf_m);

sol_manhattan = max_flow_bij;
topology = flow_matrix_bij;
