%% Init
close all;
clear all;
clc;

%% Variables
rotation_angle = 180;
tolerance = 25;
imName = '090_resize.png';
imDiff = '090.png';

%% Figure 1
I = im2double(imread(imName));
% I = I*255;

figure;
imagesc(I);
hold on;

points = detectSURFFeatures(I);
[features_1, valid_points_1] = extractFeatures(I, points);
plot (valid_points_1, 'showOrientation', true);

% plot (valid_points_1.selectStrongest(150), 'showOrientation', true);

%% With noise
variance = 0.2;
n = variance*randn(size(I));
I_noise = I + n;
figure,
imagesc(I_noise), hold on;

% examine_picture(I, I_noise, 'Image with noise', tolerance);

%%  Rotation
I_rotate = imrotate(I, rotation_angle);
figure,
imshow(I_rotate), hold on;

examine_picture(I, I_rotate, 'Rotated image', tolerance);

%% Different image
I_diff = imread(imDiff);

figure,
imshow(I_diff);
hold on;

examine_picture(I, I_diff, '2 different images', tolerance);

%% Conversion to jpg
QF = 15;
imwrite (I, 'image_converted.jpg', 'jpg', 'Quality', QF);

I_jpg = imread('image_converted.jpg');

figure,
imshow(I_jpg);
hold on;

examine_picture(I, I_jpg, 'Img converted to jpg', tolerance);