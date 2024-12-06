function path = astar_search(grid, start, goal)  
    % grid: 栅格化地图，0表示可通过，1表示障碍物  
    % start: 起点坐标 [x, y]  
    % goal: 终点坐标 [x, y]  
    % path: 从起点到终点的路径，包括起点和终点  
  
    % 初始化开放列表和关闭列表  
    openList = [start, 0, heuristic(start, goal), start]; % [x, y, g+h, parent]  
    closedList = [];  
      
    % 循环直到找到目标或开放列表为空  
    while ~isempty(openList)  
        % 选择开放列表中f值最小的节点 

        [~, idx] = min(openList(:,3));  
        currentNode = openList(idx, 1:2);  
          
        % 如果当前节点是目标节点，则构建路径并返回  
        if currentNode == goal  
            path = construct_path(currentNode, closedList);  
            return;  
        end  
          
        % 将当前节点从开放列表移至关闭列表  
        closedList = [closedList; currentNode, openList(idx,4)];  
        openList(idx,:) = [];  
          
        % 检查当前节点的所有邻居  
        neighbors = get_neighbors(currentNode);  
        for i = 1:size(neighbors,1)  
            neighbor = neighbors(i,:);  
              
            % 如果邻居在关闭列表中，跳过  
            if any(sum(closedList(:,1:2) == neighbor, 2) == 2)  
                continue;  
            end  
              
            % 计算邻居的g值  
            tentative_g = openList(idx,3) + 1; % 假设所有步骤的代价为1  
              
            % 如果邻居不在开放列表中，或者新的g值更好，则更新它  
            if isempty(find(sum(openList(:,1:2) == neighbor, 2) == 2)) || ...  
                    tentative_g < openList(find(sum(openList(:,1:2) == neighbor, 2) == 2), 3)  
                openList = [openList; neighbor, tentative_g, tentative_g + heuristic(neighbor, goal), currentNode];  
            end  
        end  
    end  
      
    % 如果没有找到路径，则返回空路径  
    path = [];  
end  
  
function h = heuristic(node, goal)  
    % 启发式函数，计算节点到目标的估计代价（这里使用曼哈顿距离）  
    h = abs(node(1) - goal(1)) + abs(node(2) - goal(2));  
end  
  
function neighbors = get_neighbors(node)  
    % 获取节点的上下左右四个邻居（可根据需要添加对角线方向）  
    neighbors = [node + [0, 1]; node + [1, 0]; node - [0, 1]; node - [1, 0]];  
    % 可以根据需要添加边界检查和其他逻辑来防止无效的邻居节点  
end  
  
function path = construct_path(currentNode, closedList)  
    % 从终点回溯到起点构建路径  
    path = [currentNode];  
    while any(currentNode ~= closedList(:,3:4))  
        idx = find(sum(closedList(:,3:4) == currentNode, 2) == 2);  
        currentNode = closedList(idx, 1:2);  
        path = [currentNode; path];  
    end  
end