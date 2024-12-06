%RRT_star Near()
function [min_cost,min_id,Xnear_id]=rrt_Xnear(T,xnew,ri)
    count=1;
    min_cost=inf;
    min_id= 1 ;
    near_cost=[];
    Xnear_id=[];
    for i=1:length(T.v)
        if sqrt(power(T.v(i).x - xnew(1),2)+power(T.v(i).x - xnew(2),2))<ri
           dis_new2Xnear = sqrt(power(T.v(i).x - xnew(1),2) + power(T.v(i).x - xnew(2),2));
           Xnear_id(count)=i;

           if T.v(i).dist + dis_new2Xnear < min_cost
              min_cost = T.v(i).dist + dis_new2Xnear;
              min_id= i; 
           end
           
           count=count+1;
        end
    end


end