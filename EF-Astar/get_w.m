function w=get_w(robot_pos,all_obstaclePos)%包含位置[x,y]，半径，速度大小，方向的数组
   w=ones(size(all_obstaclePos,1), 1);
    for i = 1:size(all_obstaclePos,1)
        x=robot_pos(1)-all_obstaclePos(i,1);
        y=robot_pos(2)-all_obstaclePos(i,2);
        r=all_obstaclePos(i,3);
        Phi(i)=(x^2+y^2)/r^2-1;
    end
    for i = 1:1:size(Phi,2)
        for j = 1:1:size(Phi,2)
            if j == i
                ;
            else
                w(i) = Phi(j)/(Phi(i)+Phi(j));
            end
        end
    end
        
        

