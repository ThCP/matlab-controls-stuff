%% generate random topologies and test them
% [sol_A] = testRandomTopologies(trf_m, number_nodes,n_delta)
% This script generates n_tries random topologies and tests how well they
% can route the traffic on the given trf_m. This acts as a "best random"
% algorithm and so in our last tests we simply set n_tries to 1 instead of
% a larger value. It also checks whether the topology is connected,
% flagging disconnected ones for later use. 

function [sol_A, min_connected, is_connected] = testRandomTopologies(trf_m, number_nodes, n_tries, n_delta)
    
    connected = zeros(1,n_tries);
    
    for count=1:n_tries
        A = random_digraph(number_nodes, n_delta);
        arcs = generateArcs(trf_m, number_nodes); 
        [bij, max_flow_A] = route_by_shortest_path (A, arcs, number_nodes, trf_m);
        array_A(count) = max_flow_A;

        bins = conncomp (digraph(bij));
        if sum(bins) == number_nodes
            connected(count) = 1;
        end
    end

sol_A = array_A;

if (sum(connected) == 0)
%     disp('No randomly generated connected topologies.');
    min_connected = min(array_A);
    is_connected = 0;
else
    s = sprintf('n of randomly generated connected topologies = %.0f', sum(connected));
%     disp(s);
    min_connected = find(min(array_A(find(connected>0))), 1 );
x    is_connected = 1;
end
