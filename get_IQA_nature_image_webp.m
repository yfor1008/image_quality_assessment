close all
clear
clc

src_path = '.\test_image\';

imgs = dir(src_path);
img_num = length(imgs);

quality = 40:5:90;
qt_num = length(quality);
webp_IQA_qt = zeros(img_num-2, 6, qt_num); % IQA: PSNR, ssim, essim, fsim, gmsd, mdsi

for index = 3:img_num
    filename1 = imgs(index).name;
    rgb1 = imread([src_path filename1]);
    YCbCr1 = rgb2ycbcr(rgb1);
    Y1 = YCbCr1(:,:,1);
    U1 = YCbCr1(:,:,2); U1 = U1(1:2:end, 1:2:end);
    V1 = YCbCr1(:,:,3); V1 = V1(1:2:end, 1:2:end);
    fidw = fopen('temp1.yuv', 'wb');
    if fidw > -1
        fwrite(fidw, Y1');
        fwrite(fidw, U1');
        fwrite(fidw, V1');
        fclose(fidw);
    end
    
    [imH, imW] = size(Y1);
    Y1 = double(Y1);
    
    for qt = 1:qt_num
        
        params1 = sprintf('-s %d %d %s -q %d -o %s', imW, imH, 'temp1.yuv', quality(qt), 'test.webp'); % 输入输出
        cmd = ['cwebp.exe ' ' ' params1 ' > test.log 2>&1']; 
        system(cmd);
        params1 = sprintf('%s -o %s', 'test.webp', 'temp2.png'); % 输入输出
        cmd = ['dwebp.exe ' ' ' params1]; 
        system(cmd);
        
        rgb2 = imread('temp2.png');
        YCbCr2 = rgb2ycbcr(rgb2);
        Y2 = double(YCbCr2(:,:,1));
        
        psnr = PSNR(Y1, Y2);
        sm = ssim(Y1, Y2);
        essim = ESSIM(Y1, Y2);
        fsim = FeatureSIM(Y1, Y2);
        gmsd = GMSD(Y1, Y2);
        mdsi = MDSI(rgb1, rgb2); % rgb图像

        webp_IQA_qt(index-2, :, qt) = [psnr, sm, essim, fsim, gmsd, mdsi];
        
        test = 0;
    end
end
save('webp_IQA_qt.mat', 'webp_IQA_qt')

