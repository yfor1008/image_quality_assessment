close all
clear
clc

load webp_IQA_qt.mat
quality = 40:5:90;

IQA = {'PSNR', 'SSIM', 'ESSIM', 'FSIM', 'GMSD', 'MDSI'};

[img_num, iqa_num, qt_num] = size(webp_IQA_qt);

figure,
for q = 1 : iqa_num
    subplot(2,3,q)
    for index = 1:img_num
        plot(quality, squeeze(webp_IQA_qt(index, q, :)), 'LineWidth', 2), hold on;
        ylabel(IQA{q})
    end
%     if q == 2
%         title('webp: 一条线为同一张图像不同压缩质量的IQA, 不同颜色为不同图像')
%     end
%     if q == 5
%         xlabel('图像质量')
%     end
    set(gca, 'fontsize', 14);
end
suptitle('webp: 一条线为同一张图像不同压缩质量的IQA, 不同颜色为不同图像')

