%% Fast coding
% [C, X] = fast_coding (G) 
% C resulting code, X formatted output, G generating matrix

function [C, X] = fast_coding (G, V)

% V = [ 0 0 0; 1 0 0; 0 1 0; 1 1 0; 0 0 1; 1 0 1; 0 1 1; 1 1 1];

[k, n] = size(G);

C = mod(V*G,2);
X = [];
for i=1:length(V) 
    S = [sprintf('%0.0f', V(i,:)) '    ' sprintf('%0.0f', C(i,1:k)) ' ' sprintf('%0.0f', C(i,k+1:n))];
    X = [X; S];
end

W = sum(C,2)
dmin = min(W(find(W>0)))
Amin = sum(C(find(sum(C, 2)==dmin),:))