function strongestCorners =  detect_corners(image,Imp, markerStyle, markerColor)  
    % 如果没有指定标记样式和颜色，则使用默认值  
    if nargin < 2 || isempty(markerStyle)  
        markerStyle = '+'; % 默认标记样式  
    end  
    if nargin < 3 || isempty(markerColor)  
        markerColor = 'r'; % 默认标记颜色为红色  
    end  
      
    % 如果图像是彩色的，则转换为灰度图像  
    if size(image, 3) == 3  
        image = rgb2gray(image);  
    end  
    %image = imresize(image, 0.5); 
      
    % 使用Harris算法检测角点  
   %corners = detectHarrisFeatures(image,'FilterSize', 31);
   %[fpoints, corners] = detectMinEigenFeatures(I, 'QualityLevel', 0.1, 'MinQualityLevel', 0.01, 'MaxFeatures', 500, 'MinDistance', 7); 
   % corners = detectFASTFeatures(image);
%   corners = detectSURFFeatures(image);
   %corners = detectBRISKFeatures(image);
%   corners = cornerPoints(image);
   corners = detectMinEigenFeatures(image,'FilterSize', 71);%,'ROI', [50,150,1000,2000]
%   corners = detectMSERFeatures(image);
%   corners = detectORBFeatures(image);
%   corners = extractFeatures(image);
%   corners = matchFeatures(image);


    figure;  
    %imshow(image); 
    imshow(Imp);  
    hold on;  
    %plot(corners.Location(:,1), corners.Location(:,2), markerStyle, 'MarkerSize', 5, 'MarkerFaceColor', markerColor);  
    % 绘制最强的50个角点，使用不同的标记样式和颜色（可选）  
    strongestCorners = corners.selectStrongest(round(1*length(corners)));  
    plot(strongestCorners.Location(:,1), strongestCorners.Location(:,2), 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'g');


    %hold off;  
end