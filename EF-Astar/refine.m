function Cpts = refine(featurePoints)  
    % 假设featurePoints是一个Nx2的矩阵，其中每一行是一个二维点(x, y)  
    % 初始化输出点集  
    Cpts = [featurePoints(1,:)];  
      
    % 检查输入点集是否为空  
    if isempty(featurePoints)  
        return;  
    end  
      
    % 遍历每一个点对（除了最后一个点）  
    for i = 1:size(featurePoints, 1) - 1  
        % 获取当前点和下一个点的坐标  
        p1 = featurePoints(i, :);  
        p2 = featurePoints(i+1, :);  
          
        % 计算两点之间的距离  
        dist = norm(p2 - p1);  
          
        % 如果距离大于0.2，则在两点之间插入点  
        if dist > 150  
            % 计算需要插入的点数（向上取整），不包括原始的两点  
            numPointsToAdd = ceil(dist / 150) - 1;  
              
            % 计算每个插入点的位置  
            for j = 1:numPointsToAdd  
                % 使用线性插值计算新点的位置  
                alpha = j / (numPointsToAdd + 1);  
                newPoint = (1 - alpha) * p1 + alpha * p2;  
                  
                % 将新点添加到输出点集中  
                Cpts = [Cpts; newPoint];  
            end  
        end  
          
        % 总是将原始点添加到输出点集中（除了最后一个点，因为它将在下一轮循环中被考虑）  
        Cpts = [Cpts; p2];  
    end  
      
    % 添加最后一个点（因为它在循环中没有被添加）  
    Cpts = [Cpts; featurePoints(end, :)];  
end