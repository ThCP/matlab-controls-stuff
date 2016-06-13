%% Testing various parameters, generating graphs.
% This scripts generates tests the algorithm against "scenarios" different
% matrices, plotting a graph which includes the maxflow of topologies
% generated by the algorithm, SCOM and a random topology with the given
% number of nodes. 
% The mean of the flows is saved in the file 'results.dat'. This is one of
% the last scripts, together with 'fix_matrices.m'.
% This script generates random matrices at every step, instead of using
% always the same matrices. This was fixed in the 'fix_matrices.m' file.

clear all, close all, clc;

check = 4; % number of steps between each reshuffle
p = 0.1; % probability of picking an arc from the bottom half of the list
n_tries = 5; % number of topologies tried by the algorithm
n_delta = 2; % number of transmitters/receivers
scenarios = 50; % number of matrices generated and tested
number_nodes = 20; % number of nodes of the traffic matrix


%% 20x20 delta = 4 k = 4 p = 0.1
fout = fopen('results.dat', 'a');
s = sprintf('%.0fx%.0f traffic matrix, n_delta = %.0f, p = %.1f, K = %.0f', number_nodes,...
    number_nodes, n_delta, p, check);
disp(s);

[fig, res] = testChangingParameters(check, p, n_tries, n_delta, scenarios, number_nodes);
filename = sprintf('%.0fx%.0fd%.0fp%.0fk%.0f', number_nodes, number_nodes, n_delta, p, check);
print(fig, filename, '-dpng');

fprintf(fout, '%s\n', filename);
fprintf(fout, '%s\n', res);

fclose(fout);

%% 20x20 delta = 4 k = 4 p = 0.7
fout = fopen('results.dat', 'a');

p = 0.7;
s = sprintf('%.0fx%.0f traffic matrix, n_delta = %.0f, p = %.1f, K = %.0f', number_nodes,...
    number_nodes, n_delta, p, check);
disp(s);
[fig, res] = testChangingParameters(check, p, n_tries, n_delta, scenarios, number_nodes);
filename = sprintf('%.0fx%.0fd%.0fp%.0fk%.0fwc', number_nodes, number_nodes, n_delta, p, check);
print(fig, filename, '-dpng');

fprintf(fout, '%s\n', filename);
fprintf(fout, '%s\n', res);


fclose(fout);

%% 40x40 delta = 2 p = 0.1 k = 4
fout = fopen('results.dat', 'a');

n_delta = 2;
p = 0.1;
number_nodes = 40;
s = sprintf('%.0fx%.0f traffic matrix, n_delta = %.0f, p = %.1f, K = %.0f', number_nodes,...
    number_nodes, n_delta, p, check);
disp(s);
[fig, res] = testChangingParameters(check, p, n_tries, n_delta, scenarios, number_nodes);
filename = sprintf('%.0fx%.0fd%.0fp%.0fk%.0fwc', number_nodes, number_nodes, n_delta, p, check);
print(fig, filename, '-dpng');

fprintf(fout, '%s\n', filename);
fprintf(fout, '%s\n', res);

fclose(fout);

%% 40x40 delta = 2 p = 0.7 k = 4
fout = fopen('results.dat', 'a');

n_delta = 2;
p = 0.7;
s = sprintf('%.0fx%.0f traffic matrix, n_delta = %.0f, p = %.1f, K = %.0f', number_nodes,...
    number_nodes, n_delta, p, check);
disp(s);
[fig, res] = testChangingParameters(check, p, n_tries, n_delta, scenarios, number_nodes);
filename = sprintf('%.0fx%.0fd%.0fp%.0fk%.0fwc', number_nodes, number_nodes, n_delta, p, check);
print(fig, filename, '-dpng');

fprintf(fout, '%s\n', filename);
fprintf(fout, '%s\n', res);

fclose(fout);
