%% Example: Magnetic Levitator
% Uncertainty analysis

%% Initialization
clc, clear all, close all;
s = tf('s');

K_nom = -7044; % Nominal value of K
p_nom = 29.68; % Nominal value of p

K = linspace (-8400, -5600, 20); % Value of K taking into account the uncertainty
p = linspace (24, 36, 10); % Value of p taking into account the uncertainty

G = K_nom/( (s+p_nom) * (s-p_nom) );
C = -8.31 * ( (1+s/10)*(1+s/37.5) ) / ( s*(1+s/562.5) ) ;

L = G * C;

T = L / (1 + L);

w = logspace (-4, 4); % Create a logaritmically spaced vector which is used to compute the frequency response

peak = 0; % Peak value, equal to gamma_T at the end

%% Considerations on stability
% Since C has a negative dcgain, L has a negative dcgain. This introduces a
% constant phase lag of -180°.
% The gain of G is positive, so no lag induced.

% The system is stable according to the Nyq. stability criterion.

%% Stability margins M_g, M_phi, M_S

% M_g and M_phi can be found by observing the graph, the results are
M_phi = 180-123;
% M_g = -15.1 dB;
figure ('name', 'Nichols plot'), nichols (L);

% M_s = 1/S_p where
S = 1 / (1+L);
m = bode (S);
S_p = max (squeeze(m));
M_s = 1/S_p;

% In case I have multiplicative uncertainty, gamma_M < 1/T_p
m = bode(T);
T_p = max(squeeze(m));


%% Building the Delta_M function
% I am building every possible Delta_M function by iterating through the
% various combinations of K and p by using 2 for loops (low efficiency). If
% I need to introduce a new value with uncertainty I add a new for loop in
% order to combine the new uncertainty with the others. This takes a long
% time if the vectors contain more than 10 values (beware)
figure ('name', 'Collection of Delta_M functions');
for ii = 1:length(K) % iterating through the values of K
    for jj = 1:length(p) % iterating through the values of p
        delta_M = ( K(ii) / (s^2 - p(jj)^2) - G ) / G;
    
        % Now I extract the mag. of the tf obtained combining the current
        % values in K(ii), p(jj)
        m = bode (delta_M, w);
        peak1 = max (squeeze(m)); % Peak value of the current tf 
        
        if peak1>peak
            peak = peak1;
        end
        loglog (w, squeeze(m)), grid on, hold on; % plot the tf, the hold on keeps 
                                                  % the same graph so I
                                                  % have all the possible
                                                  % tf build by the for
    end
end
gamma_M = peak;