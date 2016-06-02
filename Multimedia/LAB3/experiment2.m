%% Experiment 2

m = load('D:\Dresden\PRNUdataset.mat');

PRNU = m.PRNU;
%%
for i=1:length(PRNU)
    PRNU(i).fingerprint = PRNU(i).fingerprint(1:1024,1:1024);
end
%%
image_name = 'D:\Dresden\Dresden\natural\Ricoh_GX100_1\Ricoh_GX100_1_37611.JPG';

% extract noise from image
Noisex = NoiseExtractFromImage (image_name, 2);
% crop Noisex to a 1024x1024 matrix
Noisex = Noisex(1:1024, 1:1024);
%  remove artifacts
Noisex = WienerInDFT(Noisex, std2(Noisex));

% read and convert the image in greyscale
Ix = double(rgb2gray(imread(image_name)));
% crop Im to a 1024x1024 matrix
Ix = Ix (1:1024, 1:1024);

for i=1:length(PRNU)
    % normalized correlation
    C = corrcoef (Noisex, Ix.*PRNU(i).fingerprint);
    rho(i) = C(1,2);
    
    % PCE
    C = crosscorr (Noisex, Ix.*PRNU(i).fingerprint);
    Out = PCE(C);
    metric(i) = Out.PCE;
end

%%
figure,plot(1:length(metric),metric)
title('metric');

figure,plot(1:length(rho),rho)
title('rho');

%%
match = find(metric == max(metric));
s = sprintf('PCE: The correct camera is %s', PRNU(match).camera);
disp(s)

match = find(rho == max(rho));
s = sprintf('CD: The correct camera is %s', PRNU(match).camera);
disp(s)

