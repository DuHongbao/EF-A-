function obstacle = add_obstacle(radius, position, velocity, theta)
    alpha=0:pi/20:2*pi;%角度bai[0,2*pi]
    x=position(1)+radius*cos(alpha);
    y=position(2)+radius*sin(alpha);
    patch(x,y,'r','edgecolor','none','facealpha',0.15);
    obstacle = [ position, radius, velocity, theta];
end
    

