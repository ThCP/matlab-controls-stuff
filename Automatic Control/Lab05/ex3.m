%% Lab 05 ex 3
%

%% Initialization
clear all, close all, clc;
s = tf ('s');

G = 6 / ( (1+s) * (1+s/20) ); % PLANT TRANSFER FUNCTION

%% ss controller
K_C = 1
C_ss = K_C / s; % C_SS TRANSFER FUNCTION
L1 = G * C_ss; % Loop function update
C = C_ss; % Controller function update

% return
%% Transient requirements

T_p_real = 1.08; % value taken from graph
S_p_real = 1.39; % value taken from graph

T_p = 20 * log10 (T_p_real); % conversion in dB
S_p = 20 * log10 (S_p_real); % conversion in dB

wc_des = 3.8; % value taken from  graph

figure;
nichols(L1); hold on;
s_grid(S_p);
t_grid(T_p);

% return

%% PI network design
% In this case I need a PI network because delta_Phi is 64°.
w_z = 2
N = 50; % needed in order to have a proper function
p = N * w_z; % needed in order to have a proper function

C_Z = (1 + s/w_z); % PI Controller transfer function

% If the resultin transfer function is not proper, then I need to use the
% following:
% C_Z = (1 + s/w_z) / (1 + s/p);

L2 = L1 * C_Z; % Loop function update
C = C * C_Z; % Controller function update

nichols(L2);

% return

%% Magnitude correction

% Gain correction
k = 10^(2/20) % SET
L3 = L2 * k; % loop function update
C = C * k; % controller function update

nichols(L3);

% return

%% Sinusoidal disturbance correction
M_T_HF_real = 0.075; % calculated as rho_T / delta_T, taken from requirements
M_T_hf = 20 * log10 (M_T_HF_real);
t_grid (M_T_hf) % draw the locus due to this value
% 
% return

%% Robust stability condition

T = L3 / (1 + L3); % find the complementary sensitivity function

m = bode(T); % Find the values of magnitude

T_p = max(m); % Extract max. value of magnitude

gamma_M = 1/T_p % Compute the value of gamma_M

% robust stability requires gamma_M > 0.9 (from requirements)


%% Simulation
% simulation initialization
t_stop = 4; 
A_r = 0;
A_dA = 0;
A_dT = 0;
A_dY = 0;
input_switch = 1;
switch_dY = 1;
w_dT = 0;
w_dY = 0;
switch_dT = 1;

% start simulation of step input
A_r = 1;
sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Output given a step input');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

% return

% start simulation of d_A
A_r = 0;
A_dA = 1;

sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of output with input dA');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
plot (dA.time, dA.signals.values, 'r'); % plot the reference signal

% return

% start simulation of e_r
A_r = 1;
A_dA = 0;

sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of e_r');
plot (e_r.time, e_r.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

% start simulation of d_T
A_r = 0;
A_dT = 0.2;
w_dT = 100;
switch_dT = -1;

sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of output given dT');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
% plot (dT.time, dT.signals.values, 'r'); % plot the reference signal

% return

% start simulation of u(t)
A_r = 3;
A_dT = 0;
w_dT = 0;
switch_dT = 1;

sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of u(t)');
plot (u.time, u.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

