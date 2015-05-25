%% Examples Steady State Design
% Lecture AC 14 

%% Initialization
clc, clear all, close all;
s = tf('s');

%% Example 2
% p. 34 AC 14

% K_c must satisfy the constraint |K_c|>0.8333
K_c = 1; % Positive value of K_c, I must check whether this is correct
% K_c = -1 % Negative value
C_ss = K_c/s;
G = ( (s+3)*(s+8) )/( s*(s+1)^2 );

L = zpk( C_ss * G ); % Positive K_c

% figure, bode(L), grid on; % Use the Bode plot to draw a qualitative Nyquist plot.
figure;
nyquist (L); % precise version of the Nyquist plot.

L_1 = zpk ( - C_ss * G); % negative K_c

% figure, bode(L_1), grid on; 
figure;
nyquist (L_1); 

C_ss % Final value of C_ss

%% Example 3
% p. 35 AC 14 

% K_c can take any value, we choose |K_c| = 1 to ease computations
K_c = - 1; % We first try with a negative value of K_c since the product
           % K_c * K_G must be positive, and the gain K_G is negative. If
           % the system is unstable and can't be fixed, then the other sign
           % will be correct, even if still has to be made stable through
           % the introduction of additional poles/zeros

G = 500/(s^2-900); % Unstable tf, there is a positive pole
C_ss = K_c / s;

L = G * C_ss;


% figure, bode (L); % Notice the constant -90° phase due to the pole at the origin. The other poles do not introduce phase changes because 
          % their real parts are opposite and with the same frequency.
figure; 
nyquist (L); % It can be noted that the critical point is outside the contour, giving N = 0
             % Since there is a positive pole, however, P is 1 and thus we
             % have unstability.

% Consider now the positive value of K_c
K_c = 1;
C_ss = K_c / s;

L_1 = G * C_ss;

% figure, bode(L_1), grid on; 
figure;
nyquist (L_1); % The plot in this case shows that the critical point is inside the contour.
               % By introducing new poles and zeros it is possible to
               % extract the pole from the contour, resulting in N = P = 0
               % The system in this situation is stable.
               
C_ss % Final value of C_ss


%% Effect of additional pole at the origin (case as example 3)
L1 = 1/(s*(s+1)^2);
L2 = 1/(s^2*(s+1)^2);

figure; % in the first case (1 pole at the origin) I have more freedom in choosing the values needed to stabilize
nyquist (L1);
figure; % Notice the -90% phase lag of the plot
nyquist (L2);

