%% Simulink simulation 
% lab02 ex1 part 3

sys = ss(A,B,C,D); %define the ss system, which then is inserted in the block
H = tf(sys); % define the tf, which can be used by the block as well

plot (simout.time, simout.signals.values); % plot the resulting graph

% Remember: since the LTI system has 2 inputs, I need to insert 2 signals 
% because otherwise the simulation doesn't start