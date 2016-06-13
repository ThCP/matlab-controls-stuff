%% generate block matrix
% trf_m = genBlockMatrix(number_nodes)
% This function creates a traffic matrix where flow on upper left block is
% high traffic and flow on bottom right is low traffic. In the upper right
% and lower left blocks there are some connections randomly placed and with
% low traffic. This was our "worst case" matrix.
% Low traffic is unif. dist. in the range [0.5, 1.5].
% High traffic is unif. dist. in the range [5, 15].

function trf_m = genBlockMatrix(number_nodes)

number_nodes = number_nodes/2;

a = 0.5 + rand(number_nodes, number_nodes);
b = 0.5 + rand(number_nodes,number_nodes);

out = blkdiag(a,b);
out(out>0.9) = 0;

a = 5 + 10*rand(number_nodes, number_nodes);
b = 0.5 + rand(number_nodes,number_nodes);

out = flip(out) + blkdiag(a,b);

out = out - diag(diag(out));    

trf_m = out;