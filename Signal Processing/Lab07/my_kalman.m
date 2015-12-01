%% Kalman Filter

% xenp is the updated estimate
% Pnp is the updated error covariance
% zn is the measurement at time n
% xen_1p is the previous state estimate
% Pn_1p is the error covariance matrix
% H is the measurement matrix H
% R is the covariance matrix R
% PHI is the transition matrix 
% Q is the covariance matrix Q
% bn_1 is the vector b at time [n-1]

function [xenp, Pnp] = my_kalman(zn, xen_1p, Pn_1p, H, R, PHI, Q, bn_1)
% number of states of the system
N = length(xen_1p);
I = eye(N);

% State estimate extrapolation
xenm = PHI*xen_1p+bn_1;

% Error covariance extrapolation
Pnm = PHI*Pn_1p*PHI.' + Q;

% Kalman gain computation
K = Pnm*H'*inv(H*Pnm*H'+R);

% State estimate update
xenp = (I-K*H)*xenm + K*zn;

% Error covariance update
Pnp = (I - K*H)*Pnm*(I - K*H)' + K*R*K.';