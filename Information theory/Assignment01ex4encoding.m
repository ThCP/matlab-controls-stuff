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
Nsymb = 100;
% p = [ 0 0.01 0.03 0.06 0.10 0.15 0.20 0.5 1 ];

t = [0.01 0.02 0.03 0.04 0.05 0.05 0.3 0.5];

p = zeros(1, length(t));

for ii=2:length(p)
    p(ii) = p(ii-1)+t(ii-1);
end

avg = t.*log2(1./t);
entropy = sum(avg)
% return
%% generate a random number
r = rand();

for ii=1:Nsymb
    r = rand();
    x(ii) = max (find (r-p > 0));
end

% print the message
x
%% check if the probabilities are correct
% histogram(x, 'Normalization', 'Probability');

%% codeword arrays
y1 = zeros(1, length(x));

codeword_y1 = { '000', '001', '010', '011', '100', '101', '110', '111' };

codeword_y2 = { '000000', '000001', '00001', '0010', '0011', '0001', '01', '1' };

codeword_y3 = { '0000001', '000010', '000001', '00010', '00110', '00100', '01', '1' };
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

% print the message encoded according to codebook 1
msg1=msg

% print the number of bits
n_bits = length(msg1)
s=0;
for i=1:n_bits
    if(msg1(i)=='1')
        s=s+1;
    end
end

% print the probability of obtaining a "1"
prob_1 = s/n_bits*100;

% evaluate the efficiency
s=0;
for i=1:length(t)
    s = s + t(i)*length(strtrim(char(codeword_y1(i))));
end
efficiency = entropy/s

% estimate the mean qty of information


% return
%% huffman encoder
msg=''; 

encoded_y2 = cell(1, Nsymb);
for i=1:Nsymb
    encoded_y2(i) = codeword_y2(x(i));
    msg = strcat(msg, char(encoded_y2(i)));
end


% print the message encoded according to codebook 2
msg2=msg

% print the number of bits
n_bits = length(msg2)
s=0;
for i=1:n_bits
    if(msg2(i)=='1')
        s=s+1;
    end
end

% evaluate the efficiency
s=0;
for i=1:length(t)
    s = s + t(i)*length(strtrim(char(codeword_y2(i))));
end
efficiency = entropy/s
return

%% horrible, horrible encoder
msg=''; 

encoded_y3 = cell(1, Nsymb);
for i=1:Nsymb
    encoded_y3(i) = codeword_y3(x(i));
    msg = strcat(msg, char(encoded_y3(i)));
end

% print the message encoded according to codebook 3
msg3=msg