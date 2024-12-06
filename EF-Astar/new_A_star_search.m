function path = new_A_star_search(Graph)
    %Initialize Start and Target
    path = [];
    PATH_LIST = [];
    OPEN = [];
    CLOSED  = [];
    Start = Graph(1).position;
    Target = Graph(end).position;
    Target_id = size(Graph,1);
    currentNodeId = 1;

    OPEN_COUNT=1;
    CLOSED_COUNT=1;
    noPath = 1;
    goal_distance = norm(Start - Target);
    heristic_distance = norm(Start - Target);
    path_cost = 0;
    Node_id = 1;


    OPEN(OPEN_COUNT,:) = [Node_id,Node_id,heristic_distance,0.0,goal_distance];
    % node id | parent node id | heristic distance | path cost | final score 
    CLOSED(CLOSED_COUNT) = 1;
    % node id[]


    % A star Algorithm 
    min_node=1;
    path_n=1;
    %path(path_n)=OPEN(1,1);
    PATH_LIST(1,:) = [1,1];
        
    while(size(OPEN,1)~=0)
        nExpand=[];
        %nExpand= Graph(currentNodeId).neighborID;
        

        nExpand=Expand_Neighbor(currentNodeId,OPEN(min_node,4),Graph,CLOSED);%Expand the childrens of node n
        OPEN(min_node,:)=[];   %Remove node n
        OPEN_COUNT=OPEN_COUNT-1;
        if (currentNodeId==Target_id) % 如果已经找到目标，结束循环
            break;
        end
        %如果邻居节点已经在OPEN中出现，替换父节点
        E_n=[];
        e_i=1;
        for i = 1 : size(nExpand,1)
            for j= 1 : size(OPEN,1)
                if nExpand(i,1) == OPEN(j,1)
                    E_n(e_i)=i;
                    e_i=e_i+1;
                    if nExpand(i,4) < OPEN(j,5)
                        OPEN(j,4) = nExpand(i,3);
                        OPEN(j,2) = currentNodeId;
                    end
                end
            end
        end



        for i=1:size(E_n,1)
            nExpand(E_n(i,:),:)=[];
        end

        %将扩展的邻居节点加入到OPEN中

        for i = 1: size(nExpand,1)
             OPEN_COUNT = OPEN_COUNT + 1;
%            heristic_distance = norm(Graph(nExpand(i,1)).position - Target);
             OPEN(OPEN_COUNT,:) = [double(nExpand(i,1)),currentNodeId, nExpand(i,2),nExpand(i,3),nExpand(i,4)];
        end

        %弹出OPEN中fn最小的节点

        [min_num,min_node] = min(OPEN(:,5));
        currentNodeId = OPEN(min_node,1);
        path_n=path_n+1;
        %path(path_n)=OPEN(min_node,1)

        CLOSED_COUNT  = CLOSED_COUNT + 1;
        CLOSED(CLOSED_COUNT) = currentNodeId;

        PATH_LIST(path_n,:) = OPEN(min_node,1:2);



    end
    path = [];
    path_n = 1;
    child = PATH_LIST(end,1);
    path(1) = child;
    father = PATH_LIST(end,2);
    while(child ~= 1)
        child = father;
        path_n = path_n + 1;
        path(path_n) = child;
        idx =  PATH_LIST(:,1) == father;
        father = PATH_LIST(idx, 2);
    end

end