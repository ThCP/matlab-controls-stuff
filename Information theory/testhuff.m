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
x;
decoded;
return
