%% Data
close all;
clear all;
clc;

%% Variables
rotation_angle = 45;
tolerance = 25;
variance = 0.1;
imName = '090_resize.png';
imDiff = '090.png';

%% Figure 1
I = im2double(imread(imName));

points = detectSURFFeatures(I);
[features_1, valid_points_1] = extractFeatures(I, points);

%% With noise
n = variance*randn(size(I));
I_noise = I + n;
points = detectSURFFeatures(I_noise);
[features_noise, valid_points_noise] = extractFeatures(I_noise, points);

%% Check matches noise
index_matches = matchFeatures(features_1, features_noise);
matchedPoints1 = valid_points_1(index_matches(:,1));
matchedPointsNoise = valid_points_noise(index_matches(:,2));

disp('Image_1 and Image_noise');
threshold_check(features_1, features_noise, index_matches, tolerance);


%%  Rotation
I_rotate = imrotate(I, rotation_angle);

points = detectSURFFeatures(I_rotate);
[features_rotate, valid_points_rotate] = extractFeatures(I_rotate, points);

%% Check matches rotate
index_matches = matchFeatures(features_1, features_rotate);
matchedPoints1 = valid_points_1(index_matches(:,1));
matchedPointsRotate = valid_points_noise(index_matches(:,2));

disp('Image_1 and Image_rotate');
threshold_check(features_1, features_rotate, index_matches, tolerance);

%% Different image
I_diff = imread(imDiff);

points = detectSURFFeatures(I_diff);
[features_jpg, valid_points_jpg] = extractFeatures(I_diff, points);

%% Check matches different image
index_matches = matchFeatures(features_1, features_jpg);
matchedPointsJpg = valid_points_jpg(index_matches(:,2));
matchedPoints1 = valid_points_1(index_matches(:,1));

disp('Image1 and Image2');
threshold_check(features_1, features_jpg, index_matches, tolerance);

%% Conversion to jpg
QF = 15;
imwrite (I, 'image_converted.jpg', 'jpg', 'Quality', QF);

I_jpg = imread('image_converted.jpg');

points = detectSURFFeatures(I_jpg);
[features_jpg, valid_points_jpg] = extractFeatures(I_jpg, points);

%% Check matches jpg
index_matches = matchFeatures(features_1, features_jpg);
matchedPointsJpg = valid_points_jpg(index_matches(:,2));
matchedPoints1 = valid_points_1(index_matches(:,1));

disp('Image_1 and Image_jpg');
threshold_check(features_1, features_jpg, index_matches, tolerance);
