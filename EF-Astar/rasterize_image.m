function rasterize_image(input_image_path, output_image_path, grid_size)  
    % 读取原始图像  
    original_image = imread(input_image_path);  
      
    % 获取原始图像的尺寸  
    [original_height, original_width, ~] = size(original_image);  
      
    % 计算新的栅格化后的尺寸  
    new_width = floor(original_width / grid_size);  
    new_height = floor(original_height / grid_size);  
      
    % 缩小图像到栅格大小  
    small_image = imresize(original_image, [new_height, new_width], 'box');  
      
    % 放大缩小后的图像到原始尺寸，实现栅格化效果  
    rasterized_image = imresize(small_image, [original_height, original_width], 'box');  
      
    % 显示栅格化后的图像  
    imshow(rasterized_image);  
      
    % 保存栅格化后的图像  
    imwrite(rasterized_image, output_image_path);  
end