%% Assigment 2

x1 = str2array(msg); % fixed length
x2 = str2array(msg1);  % huffman
x3 = str2array(msg2); % horrible

p = 0.001;
n_steps = 100;

%% fixed length
x = x1;
% disp('fixed length');
for i=1:n_steps
    x_res = across2PAM(x, p);
%     S = ['step = ' num2str(i)];
%     disp(S);
    x = x_res;
end

e = mod(x1+x_res,2);
% n_errors = sum(e)
x_res_str1 = strrep(num2str(x_res'), ' ', '');
% return
%% huffman
x = x2;
% disp('huffman');

for i=1:4
    x_res = across2PAM(x, p);
%     S = ['step = ' num2str(i)];
%     disp(S);
    x = x_res;
end

e = mod(x2+x_res,2);
% n_errors = sum(e)
x_res_str2 = strrep(num2str(x_res'), ' ', '');


%% horrible
x = x3;
% disp('horrible');

for i=1:4
    x_res = across2PAM(x, p);
    x = x_res;
end

e = mod(x3+x_res,2);
% n_errors = sum(e)


%% DECODING
% fixed length
x_in_fixed_length = decoderFixedLength(codeword_y1, msg, Nsymb);
x_out_fixed_length = decoderFixedLength(codeword_y1, x_res_str1, Nsymb);

n_errors = length(find(not(x_in_fixed_length - x_out_fixed_length == 0)))

% huffman
x_in_huffman = decoderHuffman(codeword_y2, msg1, Nsymb);
x_out_huffman = decoderHuffman(codeword_y2, x_res_str2, Nsymb);
n_errors = length(find(not(x_in_huffman - x_out_huffman == 0)))
