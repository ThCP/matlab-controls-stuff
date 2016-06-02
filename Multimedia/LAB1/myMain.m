%% Steps 1 and 2
close all;
clear all;
clc;

%Load image
Image = double(imread('lena512.bmp'));

%% Subtract offset equal to 128
myImageZeroMean = Image-128;
figure, imshow(myImageZeroMean);
title('Image with offset');
% colormap gray

%% Divide into 8x8 blocks
a = ones(64, 1)*8;
myImageBlk = mat2cell(myImageZeroMean, a', a');

%% Perform 2D DCT on each block
D = dctmtx(8); % 8x8 dct

for i=1:64
    for j=1:64
        myImageBlkDct {i,j} = D*myImageBlk{i,j}*D';
    end
end

imgToShow = cell2mat(myImageBlkDct);
figure, imagesc(imgToShow);
title('DCT of the image');
colormap gray

%% Perform quantization with standard matrix
qualityFactor = 99;

if qualityFactor<50
	S=5000/qualityFactor;
else
	S=200-2*qualityFactor;
end

QuantMtx = stdQ();
QuantMtx = floor((S*QuantMtx+50)/100); % Note: if Q=50, the quantization table is unchanged

QuantMtx(find(QuantMtx>255)) = 255;
QuantMtx(find(QuantMtx<1)) = 1;

% generating myimageblkquant
for i=1:64
    for j=1:64
        myImageBlkQuant{i,j} = round (myImageBlkDct{i,j} ./ QuantMtx);
    end
end

figure, imagesc(cell2mat(myImageBlkQuant));
title('Quantized image');
colormap gray

%% Perform ZigZag reordering
zz = zigZagIndexes();
for i=1:64
    for j=1:64
        for k=1:64
           zigzagTemp = reshape(myImageBlkQuant{i,j},1,64);
           arrayZigZag(zz(k)) = zigzagTemp(k);
        end    
        myImgBlkZigZag{i,j} = reshape(arrayZigZag', 8,8)';
    end
end

%% Predictive DC coding
DC_predict = zeros(64,64);
for i=1:64
    for j=2:64
        myImgBlkZigZag{i,j}(1,1) = myImgBlkZigZag{i,j}(1,1) - myImgBlkZigZag{i,j-1}(1,1);
        DC_predict(i,j) = myImgBlkZigZag{i,j}(1,1);
    end
    DC_predict(i,1) = myImgBlkZigZag{i,1}(1,1);
end

%% Perform Huffman coding of DC coefficients 
DC_predict = reshape(DC_predict', 4096,1);
DC_huffman_bit = [];

for ii = 1:length(DC_predict)
    DC_huffman_bit = [DC_huffman_bit jdcenc(DC_predict(ii))];
end

%% Perform Huffman coding of AC coefficients
AC_coeffs = [];
for i = 1:64
    for j = 1:64
        tempVec = reshape(myImgBlkZigZag{i,j}, 1,64);
        EndOfBlockIndex = max(find(tempVec~=0));
        AC_coeffs = [AC_coeffs, tempVec(2:EndOfBlockIndex), 999];
    end
end
AC_huffman_bit = jacenc(AC_coeffs);
%
length_orig_pixel = size(Image,1)*size(Image,2)*8;
length_JPEG_bit = length(DC_huffman_bit)+length(AC_huffman_bit);
rate_orig_bpp = 8;
rate_JPEG_bpp = length_JPEG_bit/(size(Image,1)*size(Image,2));
%     
disp(sprintf('Bit-rate of original image = %d bit per pixel', rate_orig_bpp));
disp(sprintf('Bit-rate of JPEG-compressed file = %1.3f bit per pixel', rate_JPEG_bpp));
disp(sprintf('Compression Ratio: %2.1f%%', (1-rate_JPEG_bpp/rate_orig_bpp)*100))

%% Perform Dequantization
for i=1:64
    for j=1:64
        myImageBlkDequant{i,j} = myImageBlkQuant{i,j}.*QuantMtx;
    end
end

%% Perform 2D IDCT
for i=1:64
    for j=1:64
        myImageBlkIdct{i,j} = D'*myImageBlkDequant{i,j}*D;
    end
end

%% Recompose image from 8x8 blocks
myImageRec = cell2mat(myImageBlkIdct);
myImageRec = myImageRec+128;

figure
subplot(1,2,1)
imshow(Image/max(Image(:)));
title('Original')
subplot(1,2,2)
imshow(myImageRec/max(myImageRec(:)));
title('JPEG Reconstruction')


 