%% Generate random digraph
% A = random_digraph (number_nodes, n_delta)
% This function generates a random digraph with the given number of nodes
% and the given number of delta. It does not force the topology to be
% connected. This means that when number_nodes is large and n_delta is low
% the topology will most likely be disconnected.

function A = random_digraph (number_nodes, n_delta)
    A = zeros(number_nodes, number_nodes);

        for i = 1:number_nodes
        placed = 0;
        while placed < n_delta
            for j = 1:number_nodes
                if i ~= j && A(i,j) ~= 1
                    if placed < n_delta
                        if rand < 0.1
                            A(i,j) = 1;
                            placed = placed + 1;
                        end
                    else
                        break;
                    end
                end
            end
        end
        end
