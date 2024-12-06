%RRT_star rewire()
function T=rrt_rewire(T,Xnear_id,xnew_id)
    dis=[];
    for i=length(Xnear_id)
        id = Xnear_id(i);
        dis(i)= sqrt( power( T.v(id).x-T.v(id).x, 2 ) + power( T.v(id).y-T.v(id).y, 2 )  );
        if T.v(id).dist>T.v(xnew_id).dist+dis(i)
            T.v(id).xPrev=T.v(xnew_id).x;
            T.v(id).yPrev=T.v(xnew_id).y;
            T.v(id).dist=T.v(xnew_id).dist+dis(i);
            T.v(id).indPrev = xnew_id;
        end
    end
end
