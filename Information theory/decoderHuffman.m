%% decoder huffman
% function x_huffman = decoderHuffman (codeword, msg, Nsymb)

function x_huffman = decoderHuffman (codeword, msg, Nsymb)

max_c2 = 0;
for i = 1:length(codeword)
    if (length(codeword{i}) > max_c2)
        max_c2 = length(codeword{i});
    end
end
        
c_enc = char(codeword);
c=1;
f=0;
t2=0;

l=1;
i=1;
while i<=length(msg)
     for t2=0:max_c2
        test=msg(i:i+t2);
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
x_huffman = cell2mat(decoded);
