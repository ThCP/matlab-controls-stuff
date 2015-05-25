%% Exercise 4

s = tf('s');

A = [-1 2; 1 0];
B = [2 0]';

C = [0.5 -0.5];

H = zpk(minreal(C*inv(s*eye(2)-A)*B));