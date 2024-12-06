function traj = mybspline(Cpts)
    traj = [];

    M = [1, 4, 1, 0;
        -3, 0, 3, 0;
         3,-6, 3, 0;
        -1, 3,-3, 1]/6.0;

    for j= 1 :size(Cpts,1)-3
        for u= 0:0.1:1
            t = [1, u, u*u, u*u*u];
            traj_pos = t*M*Cpts(j:j+3,:);
            traj = [traj;traj_pos];
        end
        
    end
end




