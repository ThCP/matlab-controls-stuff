%% Lab 01

close all, clear all

A = im2double(imread('lena512.bmp'));

Adouble = double(imread('lena512.bmp'));

figure, imshow (A);
title('original image');

%% Image compression
A_offset = Adouble-128;

figure, imshow (A_offset);
title('image with offset');

a = ones(64, 1)*8;

% B = mat2cell(A_offset, a', a', [1 1 1]); % works for jpg since it has 3
% channels

B = mat2cell(A_offset, a', a'); % I use this for grayscale bmp


D = dctmtx(8);


for i=1:64
    for j=1:64
        B_dct{i,j} = D*B{i,j}*D';
    end
end

B_mat = cell2mat(B_dct);

figure, imagesc(B_mat);
colormap('gray');

%% Quantization matrix
Q = stdQ()


%% TEST

qualityFactor = 20;

if qualityFactor<50
	S=5000/qualityFactor
else
	S=200-2*qualityFactor;
end

QuantMtx = stdQ()
QuantMtx = floor((S*QuantMtx+50)/100); % Note: if Q=50, the quantization table is unchanged

myImageBlkDct = B_dct;

% generating myimageblkquant
for i=1:64
    for j=1:64
        myImageBlkQuant{i,j} = myImageBlkDct{i,j} / QuantMtx ;
    end
end

test = cell2mat(myImageBlkQuant);
figure, imagesc(test);
colormap ('gray');

