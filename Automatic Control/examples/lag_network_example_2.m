%% Lag network example 2
% 

%% Initialization
clear all, close all, clc;
s = tf ('s');

G = (s+0.2) / ( s * ( s +0.4) * (s+1) );

%% ss controller
K_C = 20
C_ss = K_C;
L1 = G * C_ss; % Loop function update

%% Transient requirements
T_p = 0.42;
S_p = 2.68;
wc_des = 4;

figure;
nichols(L1); hold on;
s_grid(S_p);
t_grid(T_p);

%% Lead network design
% Start by taking a value of m_D able to introduce the phase lead I need,
% which is delta_Phi = -107 - (-163) = 56°

m_D = 12 
w_norm = 3;
w_D = wc_des / w_norm; 

C_D = ( 1 + s/w_D ) / (1 + s / (m_D*w_D) ); % lead network

L2 = C_D * L1; % update of loop function
C = C_D * C_ss % update of the controller function
nichols (L2) % show the result
% the magnitude at wc_des is larger than 0, therefore we need to reduce it
% using a lag network.

%% Lag network design
% I need a 11.4 dB attenuation
mI = 10^(11.4/20) % transform the attenuation in natural numbers, not dB
alpha = 10; % as a rule of thumb, start with alpha = 10, then change it
wI = wc_des / (alpha*mI)
C_I = ( 1+s / (mI * wI) ) / ( 1+(s/wI) );

C = C*C_I;

L3 = L2 * C_I; % update the transfer function
nichols(L3);

%% Fixing requirements
% In this case the rise time t_r isn't satisfied, so I need to refine the
% design.

% I need a faster time constant, so I can choose a larger crossover
% function or I can choose a smaller attenuation when building the lag
% network (=> the magintude at the crossover frequency will be larger)

mI = 10^(10/20) % transform the attenuation in natural numbers, not dB
alpha = 10; % as a rule of thumb, start with alpha = 10, then change it
wI = wc_des / (alpha*mI)
C_I = ( 1+s / (mI * wI) ) / ( 1+(s/wI) );

C = C*C_I;

L3 = L2 * C_I; % update the transfer function
nichols(L3);


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
