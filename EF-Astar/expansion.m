function grayImage = expansion(grayImage)



  % 1. 读取.png灰度图片
  %grayImage = imread('result.png'); % 替换为你的图片文件名

  % 2. 将灰度图片转换为二值图像（如果需要）


  grayImage = rgb2gray(grayImage);
%   grayImage = imresize(grayImage, 0.1); 

  grayImage = 255-grayImage;
  % 选择一个阈值来二值化图像
  threshold = 0; % 你可以根据图片内容选择合适的阈值
  binaryImage = grayImage > threshold; % 将灰度值大于阈值的像素设为true（1），其余为false（0）

  % 3. 定义一个结构元素
  se = strel('disk', 30); % 半径为2的圆盘形结构元素，你可以根据需要调整大小
  % 或者使用方形结构元素
  %se = strel('square', 100); % 3x3的方形结构元素

  % 4. 使用imdilate函数进行膨胀操作
  dilatedImage = imdilate(binaryImage, se);
  %dilatedImage = - dilatedImage;

  dilatedImage = 1-dilatedImage;

  grayImage = dilatedImage * 128;

end