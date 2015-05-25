%% Lab 05 ex 1
%

%% Initialization
clear all, close all, clc;
s = tf ('s');

G = 10 / ( s * (s+5) * (s+10) ); % PLANT TRANSFER FUNCTION

%% ss controller
K_C = +5
C_ss = K_C; % C_SS TRANSFER FUNCTION
L1 = G * C_ss; % Loop function update
C = C_ss;

%% Transient requirements
T_p_real = 1;
S_p_real = 1.28;

T_p = 20 * log10 (T_p_real);
S_p = 20 * log10 (S_p_real);

wc_des = 1.75; % SET

figure;
nichols(L1); hold on;
s_grid(S_p);
t_grid(T_p);
% return
% 
%% Lead network design
% Start by taking a value of m_D able to introduce the phase lead I need,
% which is delta_Phi = #°

m_D = 6 % SET
w_norm = 0.7; % SET
w_D = wc_des/w_norm 

C_D = ( 1 + s/w_D ) / (1 + s / (m_D*w_D) ); % lead network

L2 = C_D * L1; % update of loop function
C = C_D * C; % update of the controller function
nichols (L2) % show the result
% return;

%% Magnitude correction

% Gain correction
% Take care when using this technique, I can always increase the gain but
% in order to reduce it I can't have restrictions on the lower bound of
% K_c, i.e. no "bounded" ss requirements.
k = 10^(3.82/20) % SET
L3 = L2 * k;
C = C * k;
nichols(L3);
% return;

%% Simulation
% simulation initialization
t_stop = 5; 
A_r = 0;
A_dA = 0;
A_dT = 0;
A_dY = 0;
switch_dY = 1;
input_switch = 1;
w = 0;
w_dT = 0;
w_dY = 0;
switch_dT = 0;

% simulation of step input
A_r = 1;
sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of output with step input');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

% simulation of output with disturbance
A_r = 0;
A_dA = 0.3;
sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of output with disturbance');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
plot (dA.time, dA.signals.values, 'r'); % plot the reference signal

% simulation of e_r with ramp input
A_r = 1;
input_switch = -1;

sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of e_r with ramp input');
plot (e_r.time, e_r.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

% return

% max magnitude of u(t)
input_switch = 1;
sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation of input signal u(t)');
plot (u.time, u.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

% return

% max magnitude of y(t) with step input and disturbance
A_r = 0.1;
A_dA = 0.3;

sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Simulation y(t) with input and disturbance');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

% return

%% Analysis of T(s) and S(s)
T = L3 / (1 + L3);
S = 1 / (1 + L3);
figure
bodemag (T);
figure
bodemag (S);