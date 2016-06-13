%% generate matrices worst case
% matrices = generate_matrices_worst_case(number_nodes, scenarios)
% This script generates an array of worst case traffic matrices.
% In the upper right and lower left blocks there are some connections 
% randomly placed and with low traffic. 
% Low traffic is unif. dist. in the range [0.5, 1.5].
% High traffic is unif. dist. in the range [5, 15].

function matrices = generate_matrices_worst_case(number_nodes, scenarios)
matrices = zeros(number_nodes, number_nodes, scenarios);

for ii = 1:scenarios
    mat = genBlockMatrix(number_nodes);
    matrices(:,:,ii) = mat;
end