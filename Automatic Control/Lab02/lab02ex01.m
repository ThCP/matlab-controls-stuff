%% Lab 02 exercise 1

%% Data

Ms = 400;
Mu = 50;
Ks = 2e4;
Ku = 2.5e5;
Cs = 2e3;
x0 = 0;

% define this
s = tf('s');

%% State matrices
A = [ 0 0 1 0; 0 0 0 1; -Ks/Ms Ks/Ms -Cs/Ms Cs/Ms; Ks/Mu -(Ks+Ku)/Mu Cs/Mu -Cs/Mu];

B = [0 0; 0 0; 0 1/Ms; Ku/Mu -1/Mu];

C = [-Ks/Ms Ks/Ms -Cs/Ms Cs/Ms; 0 1 0 0];
 
D = [0 1/Ms; -1 0];

%% Modal analysis
eigA = eig(A);
% after this, use lambda = Re + j*Im
% The modes are exp(Re*t)*cos(Im*t+phi)

%% Analytical expression of zs..(t)

% input
u = 0.08*(1/s);
U = [0.08; 0]*(1/s);

Y = zpk(minreal(C*inv(s*eye(4)-A)*(x0+B*U)+D*U)); %find the transfer function
%Y = zpk(minreal(C*inv(s*eye(4)-A)*(B*u+x0))) %find the transfer function
[num_Y, den_Y] = tfdata(Y(1,1), 'v'); 
[r,p] = residue (num_Y, den_Y)
mag=2*abs(r) %find the magnitude, this removes the complex conjugates
phi = angle(r) % find the phase, TODO fix this, take the angle of th
                  % the positive complex conjugate, do this for every pole
