function [ psnr ] = PSNR( srcI, dstI )
%	功能说明：计算PSNR
%   参数说明：
%       输入：
%           srcI            ——  参考图像
%           dstI            ——  压缩后图像
%       输出：
%           psnr            ——  PSNR，峰值性噪比

srcI = double(srcI);
dstI = double(dstI);
mse = abs(srcI - dstI) .* abs(srcI - dstI);
MSE = sum(mse(:))/(size(srcI, 1) * size(srcI, 2));

psnr = 20 * log10(255 / sqrt(MSE));

end

