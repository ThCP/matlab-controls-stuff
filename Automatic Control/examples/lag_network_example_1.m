%% Lag network example 1
% 

%% Initialization
clear all, close all, clc;
s = tf ('s');

G = 2 / ( (1+0.2*s) * (1+0.1*s) );

%% ss controller
K_C = 10
C_ss = K_C / s;
L1 = G * C_ss; % Loop function update

%% Transient requirements
T_p = 1.7;
S_p = 3.6;
wc_des = 1.9;

figure;
nichols(L1); hold on;
s_grid(S_p) ;
t_grid(T_p);

%% Lag network design
% I need a magnitude attenuation, since K_C has a lower bound I need a lag
% network (I cannot reduce the gain).

% I need a 19.7 dB attenuation
mI = 10^(19.7/20) % transform the attenuation in natural numbers, not dB
alpha = 10; % as a rule of thumb, start with alpha = 10, then change it
wI = wc_des / (alpha*mI)
C_I = ( 1+s / (mI * wI) ) / ( 1+(s/wI) );

C = C_ss*C_I;

L2 = L1 * C_I; % update the transfer function
nichols(L2);
return 
%% Simulation
% simulation initialization
t_stop = 10; 
A_r = 0;
A_dA = 0;
A_dT = 0;
A_dY = 0;

% start simulation of step input
A_r = 1;
sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of step input');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

% start simulation of d_A
A_r = 0;
A_dA = 1;

sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of error');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal
