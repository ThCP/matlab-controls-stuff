% Linear system result estimator
% The following function receives as input parameters a matrix A containing the 
% coefficients of a linear system and an array y which contains the results of 
% the linear equations.
% It then evaluates the system by checking the rank and sets the corresponding 
% flag as "determinate", "indeterminate", "impossible".
% If the system is solvable, the solution is computed.
% Ax = y;

function [sol, flag] = linear_system_estimator(A, y)
    % m rows, n columns
    [m,n] =  size(A);
    r = rank(A);
    if (r == max([m,n])) % check if the matrix has max rank
        sol = A\y;
        flag = 'determinate';
    else
        if  (r <= min([m,n])) 
            flag = 'impossible';
            sol = [];
        else
            flag = 'indeterminate';
            sol = [];
        end
    end
end
