% DATA
R1 = 1000;
R2 = 1000;
C1 = 1e-6;
C2 = 1e-6;

% SS
A = [-1/(R1*C1) 0 ; 1/(R1*C1) -1/(R2*C2)];
B = [1/(R1*C1); 0];
C = [0 1];
D = 0;

% INITIAL CONDITIONS
x0 = [0 0];

% TAU
tau = 1/abs(real(eig(A)));
tauMax = max(tau); % takes only the max value out of those present in the vector

% SIMULATION TIME
Tstop = 10*tauMax; % for non periodic signals

% PERIODIC SIGNAL
w = 1000; %frequency
Tmax = 2*pi/w;
%Tstop = 10*Tmax; 