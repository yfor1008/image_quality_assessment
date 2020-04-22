function [ psnr ] = PSNR( srcI, dstI )
%	����˵��������PSNR
%   ����˵����
%       ���룺
%           srcI            ����  �ο�ͼ��
%           dstI            ����  ѹ����ͼ��
%       �����
%           psnr            ����  PSNR����ֵ�����

srcI = double(srcI);
dstI = double(dstI);
mse = abs(srcI - dstI) .* abs(srcI - dstI);
MSE = sum(mse(:))/(size(srcI, 1) * size(srcI, 2));

psnr = 20 * log10(255 / sqrt(MSE));

end

