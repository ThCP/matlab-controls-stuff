%% Threshold check
% Receives in input the number of matches, the number of features of the 2 images
% and the tolerance. If the matched points are above a certain tolerance 
% the pictures match.
% threshold_check (features_1, features_2, index_matches, tolerance)

function threshold_check (features_1, features_2, index_matches, tolerance)

n_matches = length(index_matches);
min_feature = min(length(features_1), length(features_2));

ratio_matches = n_matches/min_feature*100;

X = sprintf('Percentage of matches: %f', ratio_matches)
if (ratio_matches >= tolerance)
    S = ['The images match. '];
    disp(S);
else
    disp('The images do not match.');
end