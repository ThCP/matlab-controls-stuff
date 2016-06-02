%% Step 4
close all;
clear;
clc;

%Load image
Image = double(imread('lena512.bmp'));

D = dctmtx(8); % 8x8 dct
% D_vec = [D, round(D, 3), round(D, 5), round(D, 7)];
D_vec = [D, floor(D*10)/10, floor(D*1000)/1000, floor(D*1e5)/1e5];

D_cell = mat2cell(D_vec, 8, [8, 8, 8, 8]);

QF_vector = [15 30 45 60 75];

figure;
for i=1:4
    for j=1:length(QF_vector)
        [MSE(j), bitrate(j)] = rate_distortion_curve(QF_vector(j), Image, D_cell{1,i});
    end
    if (i==1)
        plot(bitrate,MSE,'o'), hold on;
    else 
    plot(bitrate, MSE);
    end
end
legend('D', 'D_1', 'D_3', 'D_5')
title('Rate-distortion curve');
xlabel('bitrate (bpp)');
ylabel('MSE');