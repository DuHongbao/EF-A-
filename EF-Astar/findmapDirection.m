function gradient=findmapDirection(Q,map)
    gradient = [0,0];
    gradient_a = [0,0];
    gradient_b = [0,0];
    for i = 0.0:0.01:6.29
        prob = [];
        prob(1) = Q(1) + 100*cos(i);
        prob(2) = Q(2) + 100*sin(i);
        if ~collisionChecking(Q,prob,map)
            gradient_a = [cos(i),sin(i)]
        end
    end
    for i = 0.0:-0.01:-6.29
        prob = [];
        prob(1) = Q(1) + 100*cos(i);
        prob(2) = Q(2) + 100*sin(i);
        if ~collisionChecking(Q,prob,map)
            gradient_b = [cos(i),sin(i)]
        end
    end
    gradient = -(gradient_a + gradient_b)/2;
end