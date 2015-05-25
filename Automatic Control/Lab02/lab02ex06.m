%% Exercise 6
% * Lab02
% * Author: Riccardo Cappuzzo

%% Plot the unit step response of the tf H1 and H2
close all
s = tf('s');

H1 = 10/(s^2+1.6*s+4);
H2 = 20/(s^2+6*s+25);

% I need to define a new array for time because otherwise I haven't got enough elements and the error 
% is too big.
t1 = linspace (0,8, 15000);
t2= linspace (0,8, 15000);

%% first tf
y1 = step(H1,t1);
%plot (t1,y1);
y1_inf = dcgain(H1); % I use dcgain(sys) in order to find the steady state value of H1
s1 = (max(y1)-y1_inf)/y1_inf;
s1_hat = s1*100;

I = find (y1 == max(y1));
t1_hat = t1(I);
S1 = stepinfo (y1,t1,y1_inf, 'SettlingTimeThreshold', 0.05) % set the threshold to 0.05 instead of 0.02

%% second tf
y2 = step(H2,t2);
figure;
plot (t2,y2);
y2_inf = dcgain(H2); % I use dcgain(sys) in order to find the steady state value of H1
s2 = (max(y2)-y2_inf)/y2_inf;
s2_hat = s2*100;

I = find (y2 == max(y2));
t2_hat = t2(I);
S2 = stepinfo (y2,t2,y2_inf, 'SettlingTimeThreshold', 0.05) % set the threshold to 0.05 instead of 0.02

