A = [0 1; -1 -1];
B = [4 0; 10 1];
C = [1 0];
D = 0;

x0 = [0 0]';

s = tf('s');
U1 = 0;
U2 = 2;

Y = zpk(minreal(C*inv(s*eye(2)-A)*(B(:,2)*U2+x0)));

[num_Y,den_Y] = tfdata(Y, 'v')
[r,p] = residue (num_Y,den_Y)

res = r(1);

mod = abs ( res );
res_Im = imag ( res );
res_Re = real ( res );
phase1 = atan ( res_Im/res_Re );
phase2 = angle (r(1))

p_Im = imag ( p(1) );
p_Re = real ( p(1) );

t = linspace (0,10, 10000);

y1 = 2* mod * exp (p_Re) * t * cos (p_Im + phase1);
y2= 2* mod * exp (p_Re) * t * cos (p_Im + phase2);

plot (t, y1);
figure;
plot (t, y2);
