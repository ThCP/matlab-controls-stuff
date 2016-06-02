%% Experiment 1

%% Same camera as RP, natural setting
image_dir = 'D:\Dresden\Dresden\natural\Canon_Ixus70_0';
Im = dir([image_dir,'\*.jpg']);

% for i = 1:length(Im)
for i = 1:10
    clc;
    s = sprintf('* %.0f *', i);
    disp(s);
    image_name = Im(i).name;
    image_name = [image_dir '\' image_name];
    
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
    
    % normalized correlation
    C = corrcoef (Noisex, Ix.*RP);
    rho_same(i) = C(1,2);
    
    % PCE
    C = crosscorr (Noisex, Ix.*RP);
    Out = PCE(C);
    metric(i) = Out.PCE;

    clear image_name
end

%%

figure, hist(rho_same)
title('hist rho same');
figure, hist(metric)
title('hist metric same');

% figure, plot(1:20, rho_same);
% title ('rho same camera');

% figure, plot(1:20, metric);
% title ('metric same camera');

%% Different camera from RP, natural setting
image_dir = 'D:\Dresden\Dresden\natural\FujiFilm_FinePixJ50_2';
Im = dir([image_dir,'\*.jpg']);

% for i = 1:length(Im)
for i = 1:10
    clc;
    s = sprintf('* %.0f *', i);
    disp(s);
    image_name = Im(i).name;
    image_name = [image_dir '\' image_name];
    
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
    
    % normalized correlation
    C = corrcoef (Noisex, Ix.*RP);
    rho_diff(i) = C(1,2);
    
    % PCE
    C = crosscorr (Noisex, Ix.*RP);
    Out = PCE(C);
    metric_diff(i) = Out.PCE;

    clear image_name
end

%%
figure, hist(rho_diff)
title('hist rho diff');
figure, hist(metric_diff)
title('hist metric diff');

% figure, plot(1:20, rho_diff);
% title ('rho different camera');

% figure, plot(1:20, metric_diff);
% title ('metric different camera');

%%
rho = [rho_same rho_diff];
n = -0.01:0.001:0.2;
figure, hist(rho, n)
