# Image Quality Assessment(IQA)
### 测试评价图像压缩方法的质量

**压缩方法**

- JPEG: matlab自带的压缩方法
- Webp: 调用webp源码生的exe [代码](http://downloads.webmproject.org/releases/webp/) 版本: `libwebp-1.1.0-windows-x64-no-wic`

**质量评价方法**

| 方法  | 输入             | 输出       | 代码文件     | 参考                                                         |
| ----- | ---------------- | ---------- | ------------ | ------------------------------------------------------------ |
| PNSR  | YCbCr空间中的Y值 | 值越大越好 | PSNR.m       |                                                              |
| SSIM  | YCbCr空间中的Y值 | 值越大越好 | ssim.m       | [文章](https://www.cns.nyu.edu/pub/eero/wang03-reprint.pdf), [代码](https://www.cns.nyu.edu/~lcv/ssim/) |
| ESSIM | YCbCr空间中的Y值 | 值越大越好 | ESSIM.m      | [文章](https://ieeexplore.ieee.org/document/4107183), [代码](https://www.mathworks.com/matlabcentral/fileexchange/54749-essim-ref_img-dis_img) |
| FSIM  | YCbCr空间中的Y值 | 值越大越好 | FeatureSIM.m | [文章](http://www4.comp.polyu.edu.hk/~cslzhang/IQA/TIP_IQA_FSIM.pdf), [代码](http://www4.comp.polyu.edu.hk/~cslzhang/IQA/FSIM/FSIM.htm) |
| GMSD  | YCbCr空间中的Y值 | 值越小越好 | GMSD.m       | [文章](http://www4.comp.polyu.edu.hk/~cslzhang/IQA/GMSD/GMSD.pdf), [代码](http://www4.comp.polyu.edu.hk/~cslzhang/IQA/GMSD/GMSD.htm) |
| MDSI  | RGB图像          | 值越小越好 | MDSI.m       | [文章](https://arxiv.org/abs/1608.07433), [代码](https://www.mathworks.com/matlabcentral/fileexchange/59809-mdsi-ref-dist-combmethod) |

**测试图像**

为开源的用来测试压缩质量的图像, `src` 文件夹为lena示例.

共测试了 18 张图像



### 测试方法

- 对图像设定不同的量化表(图像质量 `quality=40:5:90` )进行压缩
- 对不同的压缩结果计算上述IQA参数

### 测试结果





