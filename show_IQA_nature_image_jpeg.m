close all
clear
clc

load jpeg_IQA_qt.mat
quality = 40:5:90;

IQA = {'PSNR', 'SSIM', 'ESSIM', 'FSIM', 'GMSD', 'MDSI'};

[img_num, iqa_num, qt_num] = size(jpeg_IQA_qt);

figure,
for q = 1 : iqa_num
    subplot(2,3,q)
    for index = 1:img_num
        plot(quality, squeeze(jpeg_IQA_qt(index, q, :)), 'LineWidth', 2), hold on;
        ylabel(IQA{q})
    end
%     if q == 2
%         title('JPEG: һ����Ϊͬһ��ͼ��ͬѹ��������IQA, ��ͬ��ɫΪ��ͬͼ��')
%     end
%     if q == 5
%         xlabel('ͼ������')
%     end
    set(gca, 'fontsize', 14);
end
suptitle('JPEG: һ����Ϊͬһ��ͼ��ͬѹ��������IQA, ��ͬ��ɫΪ��ͬͼ��')

