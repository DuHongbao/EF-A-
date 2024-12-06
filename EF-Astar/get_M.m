function M=get_M(robot_pos,obstacle)%obstacle包含位置[x,y]，半径，速度大小，方向的数组
    w=get_w(robot_pos,obstacle(:,1:3));
    M=diag(2);
    for i= 1:1:size(obstacle,1)
        x=robot_pos(1)-obstacle(i,1);
        y=robot_pos(2)-obstacle(i,2);
        r=obstacle(i,3);
        Tau=(x^2+y^2)/r^2;
        E=[robot_pos(1)-obstacle(i,1), robot_pos(2)-obstacle(i,2); robot_pos(2)-obstacle(i,2), -robot_pos(1)+obstacle(i,1)];
        D=[1-w(i)/(Tau+1)^0.3 0; 0 1+w(i)/(Tau+1)^0.3];
        M_n=E*D/E;
        M=M*M_n;
    end
end

    