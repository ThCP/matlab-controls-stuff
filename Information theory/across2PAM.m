%% Assigment 02 ex5
% crossing the 2PAM modulator
% x_res = across2PAM(x, error_probability)

function x_res = across2PAM(x, p)

for i=1:length(x)
    r = rand();
    if r<p
    x(i) = mod(x(i)+1,2);
    end
end

x_res = x;