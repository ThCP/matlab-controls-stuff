 %% run test over different matrices

clc, close all, clear all;

% test values
check = 3;
probability = 0.7;
n_tries = 5;
n_delta = 2;
experiment = '';

% unif matrices
%% 20x20
mat = load('trf_m20x20.mat');
trf_m = mat.trf_m;
test_multiple_times_multiple_params(trf_m,check, probability, n_tries, n_delta, 'Uniform traffic 20x20');

%% 30x30
mat = load('trf_m30x30.mat');
trf_m = mat.trf_m;
test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Uniform traffic 30x30');

%% 40x40
mat = load('trf_m40x40.mat');   
trf_m = mat.trf_m;
test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Uniform traffic 40x40');

% diag matrices
%% 20x20 main diag
mat = load('trf_m20x20blkdiag.mat');
trf_m = mat.trf_m;
test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Main block diagonal 20x20');

%% 30x30 main diag
mat = load('trf_m30x30blkdiag.mat');
trf_m = mat.trf_m;
test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Main block diagonal 30x30');

%% 40x40 main diag
mat = load('trf_m40x40blkdiag.mat');
trf_m = mat.trf_m;
test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Main block diagonal 40x40');

%% 20x20 sec diag
mat = load('trf_m20x20blkdiag.mat');
trf_m = mat.trf_m;
trf_m = flip(trf_m);
test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Secondary block diagonal 20x20');

%% 30x30 sec diag
mat = load('trf_m30x30blkdiag.mat');
trf_m = mat.trf_m;
trf_m = flip(trf_m);
test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Secondary block diagonal 30x30');

%% 40x40 sec diag
mat = load('trf_m40x40blkdiag.mat');
trf_m = mat.trf_m;
trf_m = flip(trf_m);
test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Secondary block diagonal 40x40');

% variable traffic matrices

%% 20x20
mat = load('trf_m20x20vartrf.mat');
trf_m = mat.trf_m;

test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Variable traffic 20x20');

%% 30x30
mat = load('trf_m30x30vartrf.mat');
trf_m = mat.trf_m;

test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Variable traffic 30x30');

%% 40x40
mat = load('trf_m40x40vartrf.mat');
trf_m = mat.trf_m;

test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Variable traffic 40x40');

%% 40x40 worst case

genBlockMatrix;
test_multiple_times_multiple_params(trf_m, check, probability, n_tries, n_delta, 'Worst case traffic 40x40');

beep

