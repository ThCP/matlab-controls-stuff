%% Init
close all;
clear all;
clc;

%% Variables
rotation_angle = 73;
tolerance = 25;
imName = 'rokurokubi.png';
imDiff = '090.png';

%% Figure 1
I = im2double(imread(imName));

imshow(I);
hold on;

points = detectSURFFeatures(I);
[features_1, valid_points_1] = extractFeatures(I, points);
% plot (valid_points_1, 'showOrientation', true);

plot (valid_points_1.selectStrongest(150), 'showOrientation', true);

%% With noise
variance = 2;
n = variance*randn(size(I));
I_noise = I + n;
figure,
imshow(I_noise), hold on;

points = detectSURFFeatures(I_noise);
[features_noise, valid_points_noise] = extractFeatures(I_noise, points);
plot (valid_points_noise.selectStrongest(150), 'showOrientation', true);

%% Check matches noise
index_matches = matchFeatures(features_1, features_noise);
matchedPoints1 = valid_points_1(index_matches(:,1));
matchedPointsNoise = valid_points_noise(index_matches(:,2));

figure; showMatchedFeatures(I,I_noise,matchedPoints1,matchedPointsNoise);
legend('matched points Image1', 'matched points image with noise');

disp('Image_1 and Image_noise');
threshold_check(features_1, features_noise, index_matches, tolerance);


%%  Rotation
I_rotate = imrotate(I, rotation_angle);
figure,
imshow(I_rotate), hold on;

points = detectSURFFeatures(I_rotate);
[features_rotate, valid_points_rotate] = extractFeatures(I_rotate, points);
plot (valid_points_rotate.selectStrongest(150), 'showOrientation', true);

%% Check matches rotate
index_matches = matchFeatures(features_1, features_rotate);
matchedPoints1 = valid_points_1(index_matches(:,1));
matchedPointsRotate = valid_points_noise(index_matches(:,2));

figure; showMatchedFeatures(I,I_rotate,matchedPoints1,matchedPointsRotate);
legend('matched points Image1', 'matched points rotated image');

disp('Image_1 and Image_rotate');
threshold_check(features_1, features_rotate, index_matches, tolerance);

%% Different image
I_diff = imread(imDiff);

figure,
imshow(I_diff);
hold on;

points = detectSURFFeatures(I_diff);
[features_jpg, valid_points_jpg] = extractFeatures(I_diff, points);
plot (valid_points_jpg.selectStrongest(10), 'showOrientation', true);

%% Check matches different image
index_matches = matchFeatures(features_1, features_jpg);
matchedPointsJpg = valid_points_jpg(index_matches(:,2));
matchedPoints1 = valid_points_1(index_matches(:,1));

figure; showMatchedFeatures(I,I_diff,matchedPoints1,matchedPointsJpg);
legend('matched points Image1', 'matched points Image2');

disp('Image1 and Image2');
threshold_check(features_1, features_jpg, index_matches, tolerance);

%% Conversion to jpg
QF = 15;
imwrite (I, 'image_converted.jpg', 'jpg', 'Quality', QF);

I_jpg = imread('image_converted.jpg');

figure,
imshow(I_jpg);
hold on;

points = detectSURFFeatures(I_jpg);
[features_jpg, valid_points_jpg] = extractFeatures(I_jpg, points);
plot (valid_points_jpg.selectStrongest(10), 'showOrientation', true);

%% Check matches jpg
index_matches = matchFeatures(features_1, features_jpg);
matchedPointsJpg = valid_points_jpg(index_matches(:,2));
matchedPoints1 = valid_points_1(index_matches(:,1));

figure; showMatchedFeatures(I,I_jpg,matchedPoints1,matchedPointsJpg);
legend('matched points Image1', 'matched points imageJpg');

disp('Image_1 and Image_jpg');
threshold_check(features_1, features_jpg, index_matches, tolerance);
