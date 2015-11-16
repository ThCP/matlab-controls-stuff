% Sliding mean with the Istep parameter

function [mu_est] = sliding_mean2(x,Nw,Istep)

N=length(x);
mu_est=[];

for n=0:Istep:N-1
    
    n1=n-Nw/2;
    n2=n+Nw/2-1;
    
    if n1<0
        n1=0;
    end
    
    if n2>N-1
        n2=N-1;
    end
    
    xn=x(n1+1:n2+1);
    
    mu_est=[mu_est mean(xn)];

end