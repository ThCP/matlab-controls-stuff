A = [0 6; -1 -5];
B = [0 1];

s = tf ('s');

Exp_A = inv((s*eye(2)-A));

[num_X1,den_X1] = tfdata(Exp_A (1,1), 'v')
[num_X2,den_X2] = tfdata(Exp_A (1,2), 'v')
[num_X3,den_X3] = tfdata(Exp_A (2,1), 'v')
[num_X4,den_X4] = tfdata(Exp_A (2,2), 'v')

[r1,p1] = residue (num_X1,den_X1)
[r2,p2] = residue (num_X2,den_X2)
[r3,p3] = residue (num_X3,den_X3)
[r4,p4] = residue (num_X4,den_X4)

[num_X,den_X] = tfdata(Exp_A, 'v')

[r,p] = residue (num_X, den_X);