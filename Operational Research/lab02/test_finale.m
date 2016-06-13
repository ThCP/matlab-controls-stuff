%%
number_nodes = size(trf_m,1);
n_delta = 4;
n_tries = 5;

[sol_algo, topology_algo, min_connected, connected_algo] = testTopologyMultipleTimes(trf_m, number_nodes, n_tries,  n_delta); % 
[sol_manhattan, topology] = testSmartManhattan(bij, trf_m);

min(sol_algo)
sol_manhattan

G = digraph(topology_algo);
figure, plot(G);
title('Topology generated with algorithm');

G = digraph(topology);
figure, plot(G);
title('Topology generated with smart manhattan');