%% Assignment 1
% 1. generate a vector of Nsymb in the set X = {1, ... , 8} according to
% the probabilities in 1
% 2. map the generated vector x into vectors of "1" and "0" according to
% the 3 encoders designed in the exercise 3
% 3. for each vector 
% -- measure the number of generated bits
% -- measure the probability of the bit "1"
% -- estimate the entropy of the source
% -- estimate the mean quantity of information
% 4. perform the decoding

%% initialization
close all, clear all, clc;

%% generate cumulative distribution vector
Nsymb = 20;
% p = [ 0 0.01 0.03 0.06 0.10 0.15 0.20 0.5 1 ];

t = [0.01 0.02 0.03 0.04 0.05 0.05 0.3 0.5];

p = zeros(1, length(t));

for ii=2:length(p)
    p(ii) = p(ii-1)+t(ii-1);
end

%% generate a random number
r = rand();

for ii=1:Nsymb
    r = rand();
    x(ii) = max (find (r-p > 0));
end

%% check if the probabilities are correct
% histogram(x, 'Normalization', 'Probability');

%% codeword arrays
y1 = zeros(1, length(x));

codeword_y1 = { '000', '001', '010', '011', '100', '101', '110', '111' };

codeword_y2 = { '000000', '000001', '00001', '0010', '0011', '0001', '01', '1' }; % huffman

codeword_y3 = { '0000001', '000010', '000001', '00010', '00110', '00100', '01', '1' }; % horrible encoder
max_c2 = 6;
max_c3 = 7;

% return
%% fixed length encoder
msg=''; 

encoded_y1 = cell(1, Nsymb);
for i=1:Nsymb
    encoded_y1(i) = codeword_y1(x(i));
    msg = strcat(msg, char(encoded_y1(i)));
end

x
msg1=msg

%% huffman encoder
msg=''; 

encoded_y2 = cell(1, Nsymb);
for i=1:Nsymb
    encoded_y2(i) = codeword_y2(x(i));
    msg = strcat(msg, char(encoded_y2(i)));
end

x
msg2=msg

%% horrible, horrible encoder
msg=''; 

encoded_y3 = cell(1, Nsymb);
for i=1:Nsymb
    encoded_y3(i) = codeword_y3(x(i));
    msg = strcat(msg, char(encoded_y3(i)));
end

x
msg3=msg

%% decoder fixed length
decoded = cell(1,Nsymb);
c_enc = char(codeword_y1);
c=1;
for i=1:3:length(msg1)-2
    test=msg1([i:i+2]);

    for k=1:length(c_enc)
        c_enc(k, :);
        if(strcmp(c_enc(k, :), test))
            decoded(c) = num2cell(k);
            c=c+1;
            break;
        end
    end
end

x

x_decoded = cell2mat(decoded)
return

%% decoder huffman
c_enc = char(codeword_y2);
c=1;
f=0;
t2=0;

l=1;
i=1;
while i<=length(msg2)
     for t2=0:max_c2
        test=msg2(i:i+t2);
        l=length(test);

        for k=1:length(c_enc)
            c_enc(k, :);
            if(strcmp(strtrim(c_enc(k, :)), test))
                decoded(c) = num2cell(k);
                c=c+1;
                f=1;
                break;
            end
        end
        if (f) 
            break;
        end
    end
    f=0;
    
    i=i+l;
end
x
decoded
