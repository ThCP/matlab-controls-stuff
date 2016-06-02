%% Coding theory transform number in binary

function [X] = int2bin (number, len)

if nargin == 2
    p2 = len;
else
    p2 = floor(log2(number));
end
X = zeros(p2,1);

for i=0:p2-1
    X(i+1) = mod(number,2);
    number = floor(number / 2);
end

X = (flip(X));