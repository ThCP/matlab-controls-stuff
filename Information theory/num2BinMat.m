%%
function V = num2BinMat (number)
V = zeros(number, ceil(log2(number)));
for i=0:number-1
    V(i+1, :) = int2bin(i, floor(log2(number)))';
end