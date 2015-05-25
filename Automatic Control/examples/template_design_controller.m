%% Template for control system design
% * Initialization
% * SS controller
% * transient requirements
% -- plot starting nichols diagram
% * output disturbance requirements
% Controller design
% * Phase correction
% -- lead network
% -- PID controller (add a pole if the tf is not proper)
% * magnitude correction
% -- gain
% -- lag network 
% * simulation


%% Initialization
clear all, close all, clc;
s = tf ('s');

G = 0; % PLANT TRANSFER FUNCTION

%% ss controller
K_C = 0
C_ss = K_C / s; % C_SS TRANSFER FUNCTION
L1 = G * C_ss; % Loop function update
C = C_ss; % Controller function update

return

%% Transient requirements

T_p_real = 0; % Value taken from graph
S_p_real = 0; % Value taken from graph

T_p = 20 * log10 (T_p_real); % Conversion in dB for t_grid() function
S_p = 20 * log10 (S_p_real); % Conversion in dB for s_grid() function

wc_des = 0; % Value taken from graph

figure;
nichols(L1); hold on; % Nichols diagram of the starting situation
s_grid(S_p);
t_grid(T_p);

return

%% Sinusoidal disturbances requirements
M_T_HF_real = 0; % calculated as rho_T / delta_T
M_T_HF = 20 * log10 (M_T_HF_real);
t_grid ( M_T_HF );

M_S_LF_real = 0; % calculated as rho_Y / delta_Y
M_S_LF = 20 * log10 (M_S_LF_real);
s_grid ( M_S_LF);

return

%% Controller design
% Start designing the controller transfer function.
% Phase correction
%   - lead network
%   - PID controller

%% Lead network design
% Move wc_des outside of the influence of the loci
% Start by taking a value of m_D able to introduce the phase lead I need,
% which is delta_Phi = #°

% If the phase lead needed is larger than 60° then I must either use a
% double lead network or a PID controller.

m_D = 0 % Taken from graph, a value of mD able to introduce the phase lead I need
w_norm = 0; % Taken from the graph, it is my choice. It doesn't have to be the
            % exact value for which the phase lead needed is introduced
w_D = wc_des/w_norm 

C_D = ( 1 + s/w_D ) / (1 + s / (m_D*w_D) ); % Single lead network 

L2 = C_D * L1; % loop function update
C = C_D * C; % controller function update
nichols (L2) % show the result

return

%% PID Controller
% This controller should be used if the phase difference is too large and
% would require the use of a double lead network in order to be generated.
% It is a possible solution, a double lead network should work as well.

w_z = 0 % found on the PID graph
N = 50; % needed in order to have a proper function 
p = N * w_z; % needed in order to have a proper function

C_Z = (1 + s/w_z); % PI Controller transfer function

% If the resulting transfer function is not proper, then I need to use the
% following:
% C_Z = (1 + s/w_z) / (1 + s/p);

L2 = L1 * C_Z; % Loop function update
C = C * C_Z; % Controller function update

nichols(L2);

%% Controller design
% Magnitude correction
%  - gain
%  - lag network

%% Magnitude correction

% Gain correction
% Take care when using this technique, I can always increase the gain but
% in order to reduce it I can't have restrictions on the lower bound of
% K_c, i.e. no "bounded" ss requirements.
k = 10^(0/20) % SET
L3 = L2 * k; % loop function update
C = C * k; % controller function update

% Lag network design
mI = 10^(0/20)  % SET
                % transform the attenuation in natural numbers, not dB
alpha = 10; % as a rule of thumb, start with alpha = 10, then change it
% alpha is needed to reduce the tail effect of the lag network: by
% increasing it I should be able to bring the tf outside the loci, but by
% increasing alpha I have a worse transient behavior.

wI = wc_des / (alpha*mI)
C_I = ( 1+s / (mI * wI) ) / ( 1+(s/wI) ); % LAG NETWORK TRANSFER FUNCTION

C = C * C_I; % controller function update

L3 = L2 * C_I; % transfer function update
nichols(L3);

return