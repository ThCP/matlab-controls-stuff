%% Lab 05 ex 2
% 

%% Initialization
clear all, close all, clc;
s = tf ('s');

G = 2 / ( (0.21*s+1) * (4*s+1) ); % PLANT TRANSFER FUNCTION
G.inputdelay = 0.066;
%% ss controller
% |K_C| = 1/2
K_C = 1/2;
C_ss = K_C / s; % C_SS TRANSFER FUNCTION
L1 = G * C_ss; % Loop function update

% bode(L1); % check sign with nyq.
% return
%% Transient requirements

T_p_real = 1.05;
S_p_real = 1.36;

T_p = 20 * log10 (T_p_real);
S_p = 20 * log10 (S_p_real);

wc_des = 5/10 % SET

figure;
nichols(L1); hold on;
s_grid(S_p);
t_grid(T_p);
% return;
%% Lead network design
% Start by taking a value of m_D able to introduce the phase lead I need,
% which is delta_Phi = -51°

m_D = 12 % 
w_norm = 2; % 
w_D = wc_des/w_norm 

C_D = ( 1 + s/w_D ) / (1 + s / (m_D*w_D) ); % lead network

L2 = C_D * L1; % update of loop function
C = C_D * C_ss % update of the controller function
nichols (L2) % show the result

% return;

%% Magnitude correction
% Lag network design
mI = 10^(3/20)  % SET
                % transform the attenuation in natural numbers, not dB
alpha = 8; % as a rule of thumb, start with alpha = 10, then change it
wI = wc_des / (alpha*mI)
C_I = ( 1+s / (mI * wI) ) / ( 1+(s/wI) );

C = C*C_I;

L3 = L2 * C_I; % update the transfer function
nichols(L3);
% return;
%% Simulation
% simulation initialization
t_stop = 100; 
A_r = 0;
A_dA = 0;
A_dT = 0;
A_dY = 0;
switch_dY = 1;
w = 0;
% return

% SWITCH:
% 1 = STEP
% 2 = RAMP

% start simulation of step input

input_switch = 1;
A_r = 1;
sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of step input');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

% return

% start simulation y_da

input_switch = 1;
A_r = 0;
A_dA = 0.01;
sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of y_dA');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
plot (dA.time, dA.signals.values, 'r'); % plot the reference signal

return

% start simulation e_r
A_r = 1; % slope of the ramp
input_switch = -1;

sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of error');
plot (e_r.time, e_r.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

% return

% simulation of tracking error in presence of dY = 0.1sin(0.5t)
switch_dY = -1;
A_dY = 0.1;
A_r = 0;

w = 0.05;
sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of step input');
plot (e_r.time, e_r.signals.values, 'b'); % plot the output values
hold on;
plot (dY.time, dY.signals.values, 'r'); % plot the reference signal
