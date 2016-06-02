%% decoder fixed_length
% function x_fixed_length = decoderFixedLength (codeword_y1, msg1, Nsymb)

function x_fixed_length = decoderFixedLength (codeword_y1, msg1, Nsymb)

max_c1 = 0;
for i = 1:length(codeword_y1)
    if (length(codeword_y1{i}) > max_c1)
        max_c1 = length(codeword_y1{i});
    end
end

decoded = cell(1,Nsymb);
c_enc = char(codeword_y1);
c=1;
for i=1:max_c1:length(msg1)-2
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

x_fixed_length = cell2mat(decoded);