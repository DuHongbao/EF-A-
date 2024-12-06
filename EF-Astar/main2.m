clear;
clc;
close all;


img = imread('result4.png'); % 读取图像  
  
% 检查图像是否为彩色，如果是，则转换为灰度图  
if size(img, 3) == 3  
    img_gray = rgb2gray(img); % 将彩色图像转换为灰度图  
else  
    img_gray = img; % 如果已经是灰度图，则直接使用原图  
end  
  
resized_img = imresize(img_gray, 0.04);  
% 显示调整大小后的图像  
% imshow(resized_img);  
% 如果需要，保存调整大小后的图像到新的PNG文件  
imwrite(resized_img, 'resized_result.png');

% 接下来可以使用 img_gray 进行后续处理  
% 例如，显示灰度图  
%imshow(img_gray);


% 读取灰度图像  
% img = imread('result.png'); % 替换'your_gray_image.png'为您的灰度图像文件名  
 [height, width, ~] = size(resized_img); 

% 转换为二维数组（实际上img已经是一个二维数组）  
% 如果需要，可以通过double(img)将其转换为双精度浮点数数组  
grayArray = 255-double(resized_img);   
 
tic
% 找出灰度不为0的点  
[row, col] = find(grayArray ~= 0);  
%  row = row(1:50:end);
%  col = col(end:1:1);


row = height-row;
col = [2.0; col; 160];
row = [42.0; row; 56];
picmap = [col(:), row(:)];
visualize_map(picmap, [], []);
axis equal; % 使x轴和y轴具有相同的刻度间隔，以便图像不会变形 


path = A_star_search(picmap, width, height);
toc
% visualize the 2D grid map
visualize_map(picmap, path, []);



