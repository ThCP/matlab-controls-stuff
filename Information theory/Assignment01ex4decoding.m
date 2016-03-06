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


%% decoder fixed length

x_source = x
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

x_fixed_length = cell2mat(decoded)

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
x_huffman = cell2mat(decoded)

%% decoder horrible encoder
c_enc = char(codeword_y3);
c=1;
f=0;
t2=0;

l=1;
i=1;
while i<=length(msg3)
     for t2=0:max_c3
        test=msg3(i:i+t2);
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
x_horrible = cell2mat(decoded)

