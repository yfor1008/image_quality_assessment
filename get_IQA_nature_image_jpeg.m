close all
clear
clc

src_path = '.\test_image\';

imgs = dir(src_path);
img_num = length(imgs);

quality = 40:5:90;
qt_num = length(quality);
jpeg_IQA_qt = zeros(img_num-2, 6, qt_num); % IQA: PSNR, ssim, essim, fsim, gmsd, mdsi

for index = 3:img_num
    filename1 = imgs(index).name;
    rgb1 = imread([src_path filename1]);
    YCbCr1 = rgb2ycbcr(rgb1);
    Y1 = double(YCbCr1(:,:,1));
    
    filename2 = 'temp.jpg';
    for qt = 1:qt_num
        imwrite(rgb1, filename2, 'quality', quality(qt));
        
        rgb2 = imread(filename2);
        YCbCr2 = rgb2ycbcr(rgb2);
        Y2 = double(YCbCr2(:,:,1));

        psnr = PSNR(Y1, Y2);
        sm = ssim(Y1, Y2);
        essim = ESSIM(Y1, Y2);
        fsim = FeatureSIM(Y1, Y2);
        gmsd = GMSD(Y1, Y2);
        mdsi = MDSI(rgb1, rgb2); % rgbÍ¼Ïñ

        jpeg_IQA_qt(index-2, :, qt) = [psnr, sm, essim, fsim, gmsd, mdsi];
        test = 0;
    end
end
save('jpeg_IQA_qt.mat', 'jpeg_IQA_qt')

