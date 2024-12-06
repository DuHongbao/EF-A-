function path = A_star_search(map,MAX_X,MAX_Y)
    %
    %This part is about map/obstacle/and other settings
    %pre-process the grid map, add offset
    size_map = size(map,1);
    Y_offset = 0;
    X_offset = 0;
    
    %Define the 2D grid map array.
    %Obstacle=-1, Target = 0, Start=1
    MAP=2*(ones(MAX_X,MAX_Y));
    
    %Initialize MAP with location of the target
    xval=floor(map(size_map, 1)) + X_offset;
    yval=floor(map(size_map, 2)) + Y_offset;
    xTarget=xval;
    yTarget=yval;
    MAP(xval,yval)=0;
    
    %Initialize MAP with location of the obstacle
    for i = 2: size_map-1
        xval=floor(map(i, 1)) + X_offset;
        yval=floor(map(i, 2)) + Y_offset;
        MAP(xval,yval)=-1;
    end 
    
    %Initialize MAP with location of the start point
    xval=floor(map(1, 1)) + X_offset;
    yval=floor(map(1, 2)) + Y_offset;
    xStart=xval;
    yStart=yval;
    MAP(xval,yval)=1;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %LISTS USED FOR ALGORITHM
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %OPEN LIST STRUCTURE
    %--------------------------------------------------------------------------
    %IS ON LIST 1/0 |X val |Y val |Parent X val |Parent Y val |h(n) |g(n)|f(n)|
    %--------------------------------------------------------------------------
    OPEN=[];
    %CLOSED LIST STRUCTURE
    %--------------
    %X val | Y val |
    %--------------
    % CLOSED=zeros(MAX_VAL,2);
    CLOSED=[];

    %Put all obstacles on the Closed list
    k=1;%Dummy counter
    for i=1:MAX_X
        for j=1:MAX_Y
            if(MAP(i,j) == -1)
                CLOSED(k,1)=i;
                CLOSED(k,2)=j;
                k=k+1;
            end
        end
    end
    CLOSED_COUNT=size(CLOSED,1);
    %set the starting node as the first node
    xNode=xval;
    yNode=yval;
    OPEN_COUNT=1;
    goal_distance=distance(xNode,yNode,xTarget,yTarget);
    path_cost=0;
    OPEN(OPEN_COUNT,:)=insert_open(xNode,yNode,xNode,yNode,goal_distance,path_cost,goal_distance);
    OPEN(OPEN_COUNT,1)=0;
    CLOSED_COUNT=CLOSED_COUNT+1;
    CLOSED(CLOSED_COUNT,1)=xNode;
    CLOSED(CLOSED_COUNT,2)=yNode;
    NoPath=1;

%
%This part is your homework
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START ALGORITHM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
min_node=1;
path_n=1;
PATH_LIST(path_n,:)=OPEN(1,:);
    while(size(OPEN,1)~=0) %you have to decide the Conditions for while loop exit 
        nExpand=[];
        
        nExpand=expand_array(xNode,yNode,OPEN(min_node,7),xTarget,yTarget,CLOSED,MAX_X,MAX_Y);%Expand the childrens of node n
        OPEN(min_node,:)=[];%Remove node n
        OPEN_COUNT=OPEN_COUNT-1;
        if (xNode==xTarget&&yNode==yTarget)
            break;
        end
        E_n=[];
        e_i=1;
        for i=1:size(nExpand,1)
            for j=1:size(OPEN,1)
                if nExpand(i,1:2)==OPEN(j,2:3)%如果OPEN中已经有该节点
                          E_n(e_i)=i;
                          e_i=e_i+1;
                      if nExpand(i,5)<OPEN(j,8)
                          OPEN(j,7)=nExpand(i,4);
                          OPEN(j,4:5)=[xNode,yNode];
                          break;
                      end
                end
            end
        end
        for i=1:size(E_n,1)
            nExpand(E_n(i),:)=[];
        end
        for i=1:size(nExpand,1)
                OPEN_COUNT=OPEN_COUNT+1;
                OPEN(OPEN_COUNT,:)=insert_open(nExpand(i,1),nExpand(i,2),xNode,yNode,nExpand(i,3),nExpand(i,4),nExpand(i,5));
        end
        min_node=min_fn(OPEN,OPEN_COUNT,xTarget,yTarget);

        if min_node==-1
            NoPath=0;
            break;
        end
        OPEN(min_node,1)=0;
        path_n=path_n+1;
        PATH_LIST(path_n,:)=OPEN(min_node,:);
        
        xNode=OPEN(min_node,2);
        yNode=OPEN(min_node,3);
        
        CLOSED_COUNT=CLOSED_COUNT+1;
        CLOSED(CLOSED_COUNT,1)=xNode;
        CLOSED(CLOSED_COUNT,2)=yNode;


    end %End of While Loop
 
    %Once algorithm has run The optimal path is generated by starting of at the
    %last node(if it is the target node) and then identifying its parent node
    %until it reaches the start node.This is the optimal path
    
    %
    %How to get the optimal path after A_star search?
    %please finish it
    %


    
    if NoPath==0
        msgbox('无路可走!');
        path=[];
    else
        p_n=1;
        path(p_n,:)=[xTarget,yTarget];
        last=PATH_LIST(node_index(PATH_LIST,xTarget,yTarget),:);
        while (last(2)~=xStart||last(3)~=yStart)
            last=PATH_LIST(node_index(PATH_LIST,path(p_n,1),path(p_n,2)),:);
            p_n=p_n+1;
            path(p_n,:)=last(4:5);
        end
    end
end