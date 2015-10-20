%% Example processes together

close all, clear all, clc;

N = 1000;

MAX_REPS = 10;

Ts = 1;

n = [0:1:N-1];
beta = 0.5;
 

for rep=1:MAX_REPS
    DW = random ('norm', 0, Ts, 1, N);

    W = zeros(1,N);
    % return
    W(1) = 0;
    
    for i=2:N
        W(i) = W(i-1) + DW(i);
    end
    
    DV = random ('norm', 0, 1/(2*beta)*(1-exp(-2*beta*Ts)), 1, N); 
    V = zeros(1,N);
    % return
    V(1) = 0;
    
    for i=2:N
        V(i) = V(i-1)*exp(-beta*Ts) + DV(i);
    end
    
    plot (n, W), hold on;
    plot (n, V);
    legend('Wiener', 'Ornstein-Uhlenbeck');
end