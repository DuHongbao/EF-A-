function Cpts = bsplineN2(points, grad, s)
    t = [1.1; 1.8; 1.8; 1.2];
    %grad = [0,1];
    Cpts = points + grad.*t*s;
end
