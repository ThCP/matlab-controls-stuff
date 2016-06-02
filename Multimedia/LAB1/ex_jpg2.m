%% Test JPG images

path='C:\Users\Riccardo\Desktop\ryuko_matoi_by_megamanrockx2-d6u2cue.png'
close all
img = imread(path);

image(img);

x = 1:1:784;
y = 1:1:260;

f = myfilter

newimg = zeros(260,784);
newimg = img(:,:,3);
image (newimg);
return
for i=1:784
%     y = filter(f.Numerator, 1, img(i,;1));
end