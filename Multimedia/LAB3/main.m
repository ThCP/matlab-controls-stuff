%% Lab 03 Forensics

%% 
clear all, close all, clc;

%% read all jpg images in a folder
image_dir = 'D:\Dresden\Dresden\flatfield\Canon_Ixus70_0';
Im = dir([image_dir,'\*.jpg']);
%% estimate fingerprint
addpath(image_dir);
RP = getFingerprint(Im);
%% obtain PRNU
RP = rgb2gray1(RP);
% crop RP to a 1024x1024 matrix
RP = RP(1:1024, 1:1024);


sigmaRP = std2(RP);
Fingerprint = WienerInDFT(RP,sigmaRP);