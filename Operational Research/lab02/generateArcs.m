%% generateArcs
% arcs = generateArcs(trf_m, number_nodes)
% This function generates an array of strucs which contain data regarding
% each array, i.e. the source node, the destination node, the traffic
% flowing according to the traffic matrix and the flow actually moving on
% the arc after building the logical topology. 

function arcs = generateArcs(trf_m, number_nodes)
c = 0;
for i = 1:number_nodes
    for k = 1:number_nodes
        if (trf_m(i,k) > 0)
            c=c+1;
            arcs(c).tx = i; % tx node
            arcs(c).rx = k; % rx node
            arcs(c).val = trf_m(i,k); % traffic moving from tx to rx according to trf_m
            arcs(c).flow = 0; % flow moving on lightpath tx->rx
        end
    end
end
    