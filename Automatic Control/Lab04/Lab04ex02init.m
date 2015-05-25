%% Lab 04 Exercise 2
% Initialization of functions
% Author: Riccardo Cappuzzo

clear all, close all, clc;

s = tf('s');
C_nom = 3750;
N_nom = 60;
R_nom = 0.246;

q = (C_nom ^ 2) / (2*N_nom);
p = (s + 2*N_nom/(R_nom^2*C_nom))*(s+1/R_nom);

% The uncertainty over C is 10%:
C_unc = linspace (3750-375, 3750+375, 10);
% The uncertainty over N is 15%
N_unc = linspace (60-9, 60+9, 10);
% The uncertainty over R is 10%:
unc_R = 0.246/100*10;
R_unc = linspace (0.246-unc_R, 0.246+unc_R, 10);

peak = 0; % initialization of the peak value

% Initialization of the plant transfer function
G = q/p;
% Initialization of the control transfer function
C = 1.86e-6/(1+s/0.005);
