function path_te=simplified_path(startPose,goalPose,map)
    begin = length(path.pos);
    n_p=1;
    n_tr=1;
    path_te.pos(1).x=path.pos(begin).x;
    path_te.pos(1).y=path.pos(begin).y;
    %path.pos(1).x = x_G; path.pos(1).y = y_G;
    for j = length(path.pos):-1:2
        p_begin=[path.pos(begin).x,      path.pos(begin).y];
        p_n=    [path.pos(begin-n_p).x,  path.pos(begin-n_p).y];
        dir=    atan2(p_n(1)-p_begin(1),p_n(2)-p_begin(2));
        x_new =  p_begin + Delta.*[sin(dir) cos(dir)];

        if ~collisionChecking(p_begin,p_n,Imp) ||n_p>10
            n_tr=n_tr+1;
            path_te.pos(n_tr).x=p_n(1);
            path_te.pos(n_tr).y=p_n(2);
            begin=begin-n_p;
            n_p=1;
            continue;
        else
            n_p=n_p+1;
        end
    end
    path_te.pos(n_tr+1).x= x_G;
    path_te.pos(n_tr+1).y= y_G;
end

