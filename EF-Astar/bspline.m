function position = bspline(u,Q)
    t = [1, u, u*u, u*u*u];
    M = [1, 4, 1, 0;
        -3, 0, 3, 0;
         3,-6, 3, 0;
        -1, 3,-3, 1]/6.0;

    position = t*M*Q;

end



traj_x = [];
traj_y = [];
for j= 1 :size(Qx,2)-3
    for i= 0:0.1:1
        pos_x = bspline(i,Qx(j:j+3)');
        pos_y = bspline(i,Qy(j:j+3)');
        traj_x = [traj_x,pos_x];
        traj_y = [traj_y,pos_y];
    end
end