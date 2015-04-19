%% Exercise 2 part 1
% Computation of transfer functions of a feedback control system. Review of
% time response computation  and steady state response.

%% Initialization
s = tf('s');

G = 1/(s+1)^2;
T = 4/(s+2)^2;

%% Compute the transfer function C(s) of the controller
C = minreal((4*(s+1)^2/(s+2)^2)/((1-4/(s+2)^2)))

% Compute the time response of the control input u(t), when r(t) is a unit
% step and the other inputs are set to zero.

L = G*C;
r = 1/s;
u = C*r;

y = u*G;

[num_u,den_u] = tfdata(u,'v');
[r_u,p_u] =residue (num_u,den_u);


t = linspace (0,4,10000);

[num_y,den_y] = tfdata(y,'v');
[r,p] =residue (num_y,den_y);

t = linspace (0,10, 10000);


