%% 
clc
clear all; close all;

x_I=1; y_I=1081;           % 设置初始点
x_G=3972; y_G=790;       % 设置目标点
Thr=50;                 % 设置目标点阈值50
Delta= 30;              % 设置扩展步长
%% 初始化
T.v(1).x = x_I;         % T是树，v是节点
T.v(1).y = y_I; 
T.v(1).xPrev = x_I;     
T.v(1).yPrev = y_I;
T.v(1).dist=0;         
T.v(1).indPrev = 0;    
%% 构建树
figure(1);
ImpRgb=imread('result4.png');
Imp=rgb2gray(ImpRgb);
imshow(Imp)
xL=size(Imp,2);%x轴长度
yL=size(Imp,1);%y轴长度
hold on
plot(x_I, y_I, 'ro', 'MarkerSize',10, 'MarkerFaceColor','r');
plot(x_G, y_G, 'go', 'MarkerSize',10, 'MarkerFaceColor','g');
count=1;
bFind = false;

for iter = 1:5000
    
    %1: 在地图中随机采样一个点x_rand
    x_rand=[xL*rand,yL*rand];
    %提示：用（x_rand(1),x_rand(2)）表示环境中采样点的坐标
    %plot(x_rand(1), x_rand(2), 'go', 'MarkerSize',2, 'MarkerFaceColor','g','Linewidth', 2);
    %2: 遍历树，从树中找到最近邻近点x_near 
    x_near=[];
    dis=[];
    for i=1:length(T.v)
        dis(i) = sqrt((T.v(i).x-x_rand(1))^2+(T.v(i).y-x_rand(2))^2);
    end
    [d,ind]=min(dis);
    x_near(1)=T.v(ind).x;
    x_near(2)=T.v(ind).y;
    %提示：x_near已经在树T里
    
    x_new=[];
    %3: 扩展得到x_new节点
    %提示：注意使用扩展步长Delta
    dir=atan2(x_rand(1)-x_near(1),x_rand(2)-x_near(2));
    x_new = x_near + Delta.*[sin(dir) cos(dir)];
    
    
    %检查节点是否是collision-free
    if ~collisionChecking(x_near,x_new,Imp) 
        
        continue;
    end
    count=count+1;
    plot(x_new(1), x_new(2), 'ro', 'MarkerSize',1, 'MarkerFaceColor','g','Linewidth', 1);
    %4: 将x_new插入树T 
    %提示：新节点x_new的父节点是x_near
    T.v(count).x = x_new(1);         
    T.v(count).y = x_new(2); 
    T.v(count).xPrev = x_near(1);     
    T.v(count).yPrev = x_near(2);
    T.v(count).dist=d;          
    T.v(count).indPrev = ind; 
    %5:检查是否到达目标点附近 
    %提示：注意使用目标点阈值Thr，若当前节点和终点的欧式距离小于Thr，则跳出当前for循环
    plot([x_new(1),x_near(1)],[x_new(2),x_near(2)]);
    if sqrt((x_new(1)-x_G)^2+(x_new(2)-y_G)^2) <= Thr
        plot([x_new(1),x_G],[x_new(2),y_G]);
        bFind = true;
        break;
    end
    %6:将x_near和x_new之间的路径画出来
    %提示 1：使用plot绘制，因为要多次在同一张图上绘制线段，所以每次使用plot后需要接上hold on命令
    %提示 2：在判断终点条件弹出for循环前，记得把x_near和x_new之间的路径画出来
    hold on 
end

if bFind
    path.pos(1).x = x_G; path.pos(1).y = y_G;
    path.pos(2).x = T.v(end).x; 
    path.pos(2).y = T.v(end).y;
    pathIndex = T.v(end).indPrev; 
    j=0;
    while 1
        path.pos(j+3).x = T.v(pathIndex).x;
        path.pos(j+3).y = T.v(pathIndex).y;
        pathIndex = T.v(pathIndex).indPrev;
        if pathIndex == 1
            break
        end
        j=j+1;
    end  % 沿终点回溯到起点
    path.pos(end+1).x = x_I; path.pos(end).y = y_I; % 起点加入路径
    %%
    %简化路径点
    
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
    
    %检查节点是否是collision-free
    %%
    for j = 2:length(path.pos)
        plot([path.pos(j).x; path.pos(j-1).x;], [path.pos(j).y; path.pos(j-1).y], 'g', 'Linewidth', 2);
    end
    
    for j = 2:length(path_te.pos)
        plot([path_te.pos(j).x; path_te.pos(j-1).x;], [path_te.pos(j).y; path_te.pos(j-1).y], 'b', 'Linewidth', 3);
    end
    distance = j*Delta;
else
    disp('Error, no path found!');
end

