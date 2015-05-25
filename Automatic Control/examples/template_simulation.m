%% Template of simulation of control systems
% Author: Riccardo Cappuzzo
% Simulink file: 'control_structure_a'

%% Initialization
t_stop = 10; % depends on the simulation
A_r = 0; % set to 0
A_dA = 0; % set to 0
A_dT = 0; % set to 0
A_dY = 0; % set to 0
input_switch = 1; % switch for the r(t) signal
switch_dY = 1; % switch for the dY signal
switch_dT = 1; % switch for the dT signal
w_dY = 0; % frequency of the disturbance on dY
w_dT = 0; % frequency of the disturbance on dT

%% simulation of step input
% needed to check the transient requirements
A_r = 1;
sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Output behavior due to a step input');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

%% simulation of d_A
% check the output error due to dA
A_r = 0; % turn off r(t)
A_dA = 1; % turn on the disturbance dA

sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Output error due to dA');
plot (y.time, y.signals.values, 'b'); % plot the output values
hold on;
plot (dA.time, dA.signals.values, 'r'); % plot the reference signal

%% simulation of e_r
A_r = 0; % insert the amplitude/slope of the reference signal
input_switch = 1; % put -1 here to use r(t) = tE(t)

sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure ('name', 'Error on the reference signal');
plot (e_r.time, e_r.signals.values, 'b'); % plot the output values
hold on;
plot (r.time, r.signals.values, 'r'); % plot the reference signal

%% simulation of d_T

%% simulation of d_Y


