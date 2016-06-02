%% Test JPG images

path='C:\Users\Riccardo\Desktop\ryuko_matoi_by_megamanrockx2-d6u2cue.png'
close all
img = imread(path);

image(img);

x = 1:1:784;
y = 1:1:260;


r = img(:,:,1);
figure
% surf(y,x,r);
mesh(x,y,r);

r = img(:,:,2);
figure
% surf(y,x,r);
mesh(x,y,r);

r = img(:,:,3);
figure
% surf(y,x,r);
mesh(x,y,r);
