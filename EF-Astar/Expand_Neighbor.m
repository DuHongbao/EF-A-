function exp_array=Expand_Neighbor(node_id,gn,Graph,CLOSED)
    
    exp_array=[];
    exp_count=1;
    
    for i = 1 : Graph(node_id).neighborNum
        neighbor_ID = Graph(node_id).neighborID(i);
        if  ismember(neighbor_ID, CLOSED)
            continue;
        end
            
            h = norm(Graph(neighbor_ID).position - Graph(end).position);
            exp_array(exp_count,1) = neighbor_ID;
            exp_array(exp_count,2) = h;
            exp_array(exp_count,3) = gn +  Graph(node_id).neighborDis(i);
            exp_array(exp_count,4) = exp_array(exp_count,2)+exp_array(exp_count,3);%fn
            exp_count=exp_count+1;

    end
    

end

