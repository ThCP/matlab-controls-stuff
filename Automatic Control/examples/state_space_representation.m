%% State space representation solution
% * Author: Riccardo Cappuzzo
% The function arguments are the system input _U_, the initial conditions _x0_, 
% the system matrices _A_ and _B_.

%% Initialization of functions
function [r,p] = state_space_representation (A,B,U,x0)
s = tf('s');

% Computation of X(s)
X = zpk(minreal(inv(s*eye(size(A))-A)*(B*U+x0')));
[num_X, den_X] = tfdata (X(1),'v');
[r, p] = residue (num_X, den_X);

end
