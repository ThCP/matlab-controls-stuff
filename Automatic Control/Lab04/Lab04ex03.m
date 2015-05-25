%% Lab 04 Exercise 3
% Author: Riccardo Cappuzzo

%% Part 1
G = 10/(s*(s+5)*(s+10));

% Modulus of Kc, I am trying with the plus sign. If the Nyquist diagram of
% L shows that the function is stable, then the sign is correct. Otherwise,
% I will choose the opposite sign. In case neither one is correct, I should
% check with C_t. I know because of a theorem that a stable system must
% have a stable controller.

Kc = 5; 
C = Kc;

L = G*C;

figure, nyquist(L);