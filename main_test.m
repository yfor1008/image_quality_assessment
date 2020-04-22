close all
clear
clc

%% ≤‚ ‘

im1 = imread('orig.bmp');
im2 = imread('test.bmp');

im1 = double(im1);
im2 = double(im2);

Y1 = 0.299 * im1(:,:,1) + 0.587 * im1(:,:,2) + 0.114 * im1(:,:,3);
Y1 = round(Y1);
Y1(Y1 < 0) = 0;
Y1(Y1 > 255) = 255;

Y2 = 0.299 * im2(:,:,1) + 0.587 * im2(:,:,2) + 0.114 * im2(:,:,3);
Y2 = round(Y2);
Y2(Y2 < 0) = 0;
Y2(Y2 > 255) = 255;

psnr = PSNR(Y1, Y2);
essim = ESSIM(Y1, Y2);
fsim = FeatureSIM(Y1, Y2);
gmsd = GMSD(Y1, Y2);
mdsi = MDSI(im1, im2); % rgbÕºœÒ
sm = ssim(Y1, Y2);
