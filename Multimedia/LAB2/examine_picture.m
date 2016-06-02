%% Extract features, print the image, check threshold
% examine_picture(I1, I2, transformation_name)

function examine_picture(I1, I2, transformation_name, tolerance)

points = detectSURFFeatures(I1);
[features_1, valid_points_1] = extractFeatures(I1, points);

points = detectSURFFeatures(I2);
[features_2, valid_points_2] = extractFeatures(I2, points);
% plot (valid_points_2.selectStrongest(150), 'showOrientation', true);
plot (valid_points_2, 'showOrientation', true);


%% Check matches noise
index_matches = matchFeatures(features_1, features_2);
matchedPoints1 = valid_points_1(index_matches(:,1));
matchedPoints2 = valid_points_2(index_matches(:,2));

figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);
% legend('matched points Image1', 'matched points image with noise');

disp(transformation_name);
threshold_check(features_1, features_2, index_matches, tolerance);

