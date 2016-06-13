%% generate matrices
% matrices = generate_matrices_unif (number_nodes, scenarios)
% This script generates an array of traffic matrices with uniform traffic.
% traffic is in range [0.5 1.5]

function matrices = generate_matrices_unif(number_nodes, scenarios)

matrices = zeros(number_nodes, number_nodes, scenarios);

for ii = 1:scenarios
    matrices(:,:,ii) = 0.5+rand(number_nodes,number_nodes);
end