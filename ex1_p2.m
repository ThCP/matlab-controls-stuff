%% Exercise 1 part 2
% Draw the Nichols plot of the loop function L(s) to evaluate its crossover
% frequency and the gain and the phase stability margins.

%% Initialization
clc;
clear all, close all;
s = tf('s');

C = -0.5;
G = -(1-s)/(s*(1+s)^2*(1+s/5));
L = zpk(minreal(G*C));

%% Nichols plot
figure, nichols (L);

%% Crossover frequency
% W_g = frequency at which Gain=0dB
% Taken directly from the graph
W_g = 0.454

