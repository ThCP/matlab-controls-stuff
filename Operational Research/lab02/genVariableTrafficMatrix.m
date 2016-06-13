%% Generate variable traffic matrix
% matrices = generate_matrices_trf_variable(number_nodes, scenarios)
% This script generates traffic matrix with mixed traffic.
% 90% of the traffic is low (range [0.5 1.5])
% 10% of the traffic is high (range[5 15])

% Note: this script is outdated. 

number_nodes = 40;

trf_m = 0.5 + rand(number_nodes, number_nodes);

for i = 1:number_nodes
    for j = 1:number_nodes
        if (rand<0.1)
            trf_m(i,j) = 5+10*rand;
        end
    end
end