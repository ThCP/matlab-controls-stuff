%% Receives an Image as an input and returns features and valid points
% [features, valid_points] = find_features(Image)
function [features, valid_strongest] = find_features(Image)

%% Detecting keypoints
points = detectSURFFeatures(Image);

%% Selecting features
[features, valid_points] = extractFeatures(Image, points);
valid_strongest = valid_points.selectStrongest(20);
