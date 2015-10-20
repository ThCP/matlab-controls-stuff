%% Signal Processing 
% Lab 01

% Exercise 1

function Nfact = my_factorial (N)

if (N<0)
    Nfact = 0;
end

s=1;
for i=1:N
    s=s*i;
end

Nfact=s;

