%% Signal Processing 
% Lab 01

% Exercise 2

function Afact = my_factorial_ext(A)

[M,N] = size(A);

for i = 1:M
    for j = 1:N
        Afact(i,j) = my_factorial(A(i,j));
    end
end