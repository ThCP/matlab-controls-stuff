s = tf('s');
U = 2/s, x0 = [0.1;0.05];

X = zpk (minreal(inv(s*eye(2)-A)*(B*U+x0)))

[num_X1, den_X1] = tfdata(X(1), 'v');
[num_X2, den_X2] = tfdata(X(2), 'v');

[r1,p1] = residue (num_X1, den_X1)
[r2,p2] = residue (num_X2, den_X2)

t = linspace (0, Tstop, 1000);

figure;
x_1 = (-1.9*exp(-1000.*t) +2);
plot (t, x_1);

figure;
x_2 = (-1.9*exp(-1000.*t) -1900.*t.*exp (-1000.*t) +2);
plot (t, x_2);
