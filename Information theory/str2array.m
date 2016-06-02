%% str2array
% X = str2array(str)

function X = str2array (str)

X = zeros(length(str),1);
for i=1:length(str)
    X(i) = str(i)-'0';
end
