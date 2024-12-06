function E=get_E(robot_pos,obstacle)%包含位置[x,y]，半径，速度大小，方向的数组
    for i= size(obstacle,1)
        E(1,:,:)=[robot_pos(1)-obstacle(i,1), robot_pos(2)-obstacle(i,2); robot_pos(2)-obstacle(i,2), -robot_pos(1)+obstacle(i,1)];
    end
    

end
