%% test fast coding

clear all, close all, clc;

G = [1 1 0 1 0; 1 0 0 1 1; 0 1 1 0 1];

V = num2BinMat(2^size(G,1))
[C, X] = fast_coding(G, V)
