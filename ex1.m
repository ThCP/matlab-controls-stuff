%% Exercise 1 Part 1
% * Lab 03
% * Author: Riccardo Cappuzzo
% * 2015-05-17

%% Initialization of functions

clc;
clear all, close all;
s = tf('s');

C = -0.5;
G = -(1-s)/(s*(1+s)^2*(1+s/5));
L = zpk(minreal(G*C));

T = L/(1+L);

%% Evaluation of the poles of T
pT = pole(T);
% All the poles have negative real part, thus from this point of view the
% function is stable.

%% Nyquist stability criterion
% # determine the number P of poles of _L(s)_ with positive real part
% # draw the nyq diagram of _L(s)_
% # compute the number _N_ of encirclements of the nyq diagram of L around
% the critical point (-1, j0)
% # compute the number _Z_ of the closed loop poles with positive real part
% as _Z_ = _N_ + _P_
% The system is stable iff _Z_=0


% 1.
p = pole (L);
P = length (find (p>0));
% 2.
figure, nyquist (L);
% 3.
% No encirclements, thus N = 0
N = 0;
Z = N+P;
% The system is stable
