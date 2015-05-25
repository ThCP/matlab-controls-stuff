%% Exercise 8

s = tf ('s');

H = 1/(s^3+2*s^2+5.25*s+4.25);

zpk(minreal(H))

U = (3*0.1/(s^2+0.1^2)+2/s);

Y = zpk(minreal(U*H));

[num_Y, den_Y] = tfdata(Y,'v');

[r,p] = residue (num_Y, den_Y);

mag = 2*abs(r);
phi = angle(r);