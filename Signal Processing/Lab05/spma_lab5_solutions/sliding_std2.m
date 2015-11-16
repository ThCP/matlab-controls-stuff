% Sliding standard deviation with the Istep parameter

function [std_est] = sliding_std2(x,Nw,Istep)

N=length(x);
std_est=[];

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
    
    std_est=[std_est std(xn)];

end