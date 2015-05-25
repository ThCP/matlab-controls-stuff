%% Example transient analysis
% Author: Riccardo Cappuzzo
% 2015/05/06

%% Initialization
clear all, close all, clc;
s = tf ( 's' );

% Definition of the controller tf and of the plant tf
C = - 8.31 * ( (1+s/10) * (1+s/37.5) ) / ( s * (1+s/562.5) ) ;
G = - 7044 / ( (s - 29.68) * (s + 29.68) );

% simulation settings
t_stop = 1; % VERY IMPORTANT: this t_stop may be wrong
            % I must make sure that the simulation reaches steady state
            % before its end, otherwise I have a wrong result            
            % I set the amplitude of the step responses to zero, 
            % I use steps because they are the most critical 
            % input I can feed to the system
A_r = 0;
A_dA = 0;
A_dT = 0;
A_dY = 0;


% start simulation
A_r = 0.1;

sim ('control_structure_a'); % use this control structure with the 
                             % amplitude of the steps defined above
figure;
plot (y.time, y.signals.values); % plot the output values
hold on;
plot (r.time, r.signals.values); % plot the reference signal
