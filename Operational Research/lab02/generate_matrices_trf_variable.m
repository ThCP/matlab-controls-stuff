%% Generate traffic matrices with mixed traffic
% matrices = generate_matrices_trf_variable(number_nodes, scenarios)
% This script generates an array of traffic matrices with mixed traffic.
% 90% of the traffic is low (range [0.5 1.5])
% 10% of the traffic is high (range[5 15])

function matrices = generate_matrices_trf_variable(number_nodes, scenarios)

matrices = zeros(number_nodes, number_nodes, scenarios);

for ii = 1:scenarios
    matrices(:,:,ii) = 0.5+rand(number_nodes,number_nodes);
    for jj = 1:number_nodes
        for kk = 1:number_nodes
            if (rand<=0.1)
                matrices(jj,kk,ii) = matrices(jj,kk,ii)*10;
            end
        end
    end
end