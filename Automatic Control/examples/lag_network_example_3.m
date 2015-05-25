%% Lag network example 3
% 

%% Initialization
clear all, close all, clc;
s = tf ('s');

G = 2 / ( (0.21*s)*(4*s+1) );
G.inputdelay = 0.066;

%% ss controller
K_C = 1
C_ss = K_C/s;
L1 = G * C_ss; % Loop function update

%% Transient requirements
T_p = 0.42;
S_p = 2.66;
wc_des = 0.5;

figure;
nichols(L1); hold on;
s_grid(S_p);
t_grid(T_p);

%% Lead network design
% Start by taking a value of m_D able to introduce the phase lead I need,
% which is delta_Phi = -107 - (-161) = 54°

m_D = 10
w_norm = 3;
w_D = wc_des / w_norm;

C_D = ( 1 + s/w_D ) / (1 + s / (m_D*w_D) ); % lead network

L2 = C_D * L1; % update of loop function
C = C_D * C_ss % update of the controller function
nichols (L2) % show the result

%% Gain attenuation
% since I don't have constraints on the value of K_c (no lower bounds) I
% can correct the gain by multiplying it by 0<k<1

k = 10 ^(-14.6/20)
L3 = L2 * k;
C = C * k;
nichols (L3);

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

return;

%% Variation: I take a smaller value for w_norm: 
% in this way I introduce a smaller phase lead and a smaller increase 
% in magnitude.

% I need to correct the gain

k = 10 ^(-11.8/20)
L3 = L2 * k;
C = C * k;

nichols (L3);
