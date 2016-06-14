%% Testing various parameters, generating graphs.
% This scripts generates tests the algorithm against "scenarios" different
% matrices, plotting a graph which includes the maxflow of topologies
% generated by the algorithm, SCOM and a random topology with the given
% number of nodes. 
% The mean of the flows is saved in the file 'results.dat'. This is one of
% the last scripts, together with 'fix_matrices.m'.

% The variable "matrices" is an array of traffic matrices where 90% of the
% traffic is low and 10% of the traffic is large. 

clear all, close all, clc;

%%
check = 4; % number of steps between each reshuffle
p = 0.1; % probability of picking an arc from the bottom half of the list
n_tries = 5; % number of topologies tried by the algorithm
n_delta = 4; % number of transmitters/receivers
scenarios = 50; % number of matrices generated and tested
number_nodes = 20; % number of nodes of the traffic matrix

% m = load('fixed_wc.mat'); % comment this and the line below for trying traffic matrix with variable traffic
% matrices = m.m_wc;

matrices = generate_matrices_trf_variable(number_nodes, scenarios); % comment this line to use the worst case matrix
% the matrices variable contains an array of matrices which is used as a
% test set for the algorithms. It remains the same through the different
% tests.

%% 20x20 delta = 4 k = 4 p = 0.1
fout = fopen('results.dat', 'a');
s = sprintf('%.0fx%.0f traffic matrix, n_delta = %.0f, p = %.1f, K = %.0f', number_nodes,...
    number_nodes, n_delta, p, check);
disp(s);

[fig, res] = testChangingParameters(check, p, n_tries, n_delta, scenarios, number_nodes, matrices);
filename = sprintf('%.0fx%.0fd%.0fp%.0fk%.0f_fm_wc', number_nodes, number_nodes, n_delta, p, check);
print(fig, filename, '-dpng');

fprintf(fout, '%s\n', filename);
fprintf(fout, '%s\n', res);

fclose(fout);

%% 20x20 delta = 4 k = 4 p = 0.7
fout = fopen('results.dat', 'a');

scenarios = 50;

p = 0.7;
s = sprintf('%.0fx%.0f traffic matrix, n_delta = %.0f, p = %.1f, K = %.0f', number_nodes,...
    number_nodes, n_delta, p, check);
disp(s);
[fig, res] = testChangingParameters(check, p, n_tries, n_delta, scenarios, number_nodes, matrices);
filename = sprintf('%.0fx%.0fd%.0fp%.0fk%.0f_fm_wc', number_nodes, number_nodes, n_delta, p, check);
print(fig, filename, '-dpng');

fprintf(fout, '%s\n', filename);
fprintf(fout, '%s\n', res);


fclose(fout);

%% 40 nodes
number_nodes = 40;
% matrices = m.m_wc2; % uncomment this and comment the line below to use
% the worst case matrix
matrices = generate_matrices_trf_variable(number_nodes, scenarios); % uncomment this and comment above
% to use a variable traffic matrix

%% 40x40 delta = 2 p = 0.1
fout = fopen('results.dat', 'a');

n_delta = 2;
p = 0.1;
number_nodes = 40;
s = sprintf('%.0fx%.0f traffic matrix, n_delta = %.0f, p = %.1f, K = %.0f', number_nodes,...
    number_nodes, n_delta, p, check);
disp(s);
[fig, res] = testChangingParameters(check, p, n_tries, n_delta, scenarios, number_nodes, matrices);
filename = sprintf('%.0fx%.0fd%.0fp%.0fk%.0f_fm_wc', number_nodes, number_nodes, n_delta, p, check);
print(fig, filename, '-dpng');

fprintf(fout, '%s\n', filename);
fprintf(fout, '%s\n', res);

fclose(fout);

%% 40x40 delta = 2 p = 0.7
fout = fopen('results.dat', 'a');

n_delta = 2;
p = 0.7;
s = sprintf('%.0fx%.0f traffic matrix, n_delta = %.0f, p = %.1f, K = %.0f', number_nodes,...
    number_nodes, n_delta, p, check);
disp(s);
[fig, res] = testChangingParameters(check, p, n_tries, n_delta, scenarios, number_nodes, matrices);
filename = sprintf('%.0fx%.0fd%.0fp%.0fk%.0f_fm_wc', number_nodes, number_nodes, n_delta, p, check);
print(fig, filename, '-dpng');

fprintf(fout, '%s\n', filename);
fprintf(fout, '%s\n', res);

fclose(fout);

beep