clc;clear;%close all;
img = imread('result4.png'); % 读取图像


Imp=  rgb2gray(img);
%Imp = imresize(Imp, 0.1); 

image = expansion(img);
% 
tic
corners = detect_corners(image,Imp, 'o', 'b'); % 调用函数，指定标记样式为圆圈，颜色为蓝色
toc

% a = [rand*4093,rand*2303];
% b = [rand*4093,rand*2303];

 %imshow(Imp)
 hold on
 %plot([corners(1).Location(1),corners(2).Location(1)],[corners(1).Location(1),corners(2).Location(2)],'r-','MarkerSize',3, 'MarkerFaceColor','g','Linewidth', 1);
 %plot([a(1),b(1)],[a(2),b(2)],'r-','MarkerSize',3, 'MarkerFaceColor','g','Linewidth', 1);
 startPoint = [80,1000.0];
 targetPoint = [4000.0,1274.0];

 Nodes = [startPoint;corners.Location;targetPoint];


 
 Node = struct();
 Node.position = [];
 Node.neighborID = int64([]);
 Node.neighborNum = int64(0);
 Node.neighborDis = double([]);
 Graph = repmat(Node, length(Nodes), 1);

 plot(startPoint(1),startPoint(2),'b*','MarkerSize',10);
 plot(targetPoint(1),targetPoint(2),'r*','MarkerSize',10);

% for i = 1 : length(Nodes) 
%     a = Nodes(i,:);
%     for j = i+1 : length(Nodes)
%         b = Nodes(j,:);
%         if collisionChecking(a,b,Imp)
%             %plot([a(1),b(1)],[a(2),b(2)],'g-','MarkerSize',10, 'MarkerFaceColor','magenta','Linewidth', 1);
%             plot([a(1), b(1)], [a(2), b(2)], 'Color', [1, 0.5, 0], 'LineWidth', 1); 
% %         else
% %             plot([a(1),b(1)],[a(2),b(2)],'b-','MarkerSize',10, 'MarkerFaceColor','gold','Linewidth', 1);
%         end
%     end
% end
tic
for i = 1: length(Nodes)
    a = Nodes(i,:);
    Graph(i).position = Nodes(i,:);
    
    for j = 1 : length(Nodes)
        if i == j
            continue;
        end
        b = Nodes(j,:);
        if collisionChecking(a,b,Imp)
            Graph(i).neighborNum = Graph(i).neighborNum + 1;
            Graph(i).neighborID(Graph(i).neighborNum) = j;
            Graph(i).neighborDis(Graph(i).neighborNum) = norm(a-b);
        end

    end
end
Qx = [];
Qy = [];
path = new_A_star_search(Graph);
for i = 1 : size(path,2)-1
    a = Graph(path(i)).position;
    Qx = [Qx,a(1)];
    Qy = [Qy,a(2)];
    b = Graph(path(i+1)).position;
   
    %plot([a(1), b(1)], [a(2), b(2)], 'Color', [1, 0, 0], 'LineWidth', 1); 
end


toc
Qx = [targetPoint(1), targetPoint(1), targetPoint(1), Qx,80,80,80];
Qy = [targetPoint(2), targetPoint(2), targetPoint(2), Qy,1000,1000,1000];





%   Qy(1,10) = 800;
%   Qy(1,9) = 750;
%   Qy(1,8) = 1200;
%   Qy(1,7) = 1200;
%   Qy(1,6) = 900;
%   Qy(1,5) = 1450;
points = [Qx',Qy'];

traj = mybspline(points);
plot(traj(:,1),traj(:,2),'r:','LineWidth', 2);

Cpts = refine(points);
traj = mybspline(Cpts);

% traj_x = [];
% traj_y = [];
% for j= 1 :size(Qx,2)-3
%     for i= 0:0.1:1
%         pos_x = bspline(i,Qx(j:j+3)');
%         pos_y = bspline(i,Qy(j:j+3)');
%         traj_x = [traj_x,pos_x];
%         traj_y = [traj_y,pos_y];
%     end
% end
hold on
plot(Cpts(:,1)',Cpts(:,2)','k+');
plot(traj(:,1),traj(:,2),'r-','LineWidth', 2);


for j= 5 :size(points,1)-3
  gradient = findmapDirection(points(j,:),Imp);
  quiver(points(j,1),points(j,2), 100*gradient(1), 100*gradient(2), 1, 'AutoScale', 'off','MaxHeadSize', 1.5,'LineWidth',1.5);
end

for i = 5:size(points,1) -3
    for j = 5: size(Cpts,1)-3
        if norm(points(i,:)-Cpts(j,:)) < 10.0
            grad = findmapDirection(points(i,:),Imp);
            Cpts(j-2:j+1,:) = bsplineN2(Cpts(j-2:j+1,:),grad,5);
        end
    end
end

plot(Cpts(:,1)',Cpts(:,2)','k+');
traj = mybspline(Cpts);
plot(traj(:,1),traj(:,2),'c-','LineWidth', 2);



for i = 5:size(points,1) -3
    for j = 5: size(Cpts,1)-3
        if norm(points(i,:)-Cpts(j,:)) < 10.0
            grad = findmapDirection(points(i,:),Imp);
            Cpts(j-2:j+1,:) = bsplineN2(Cpts(j-2:j+1,:),grad,5);
        end
    end
end

plot(Cpts(:,1)',Cpts(:,2)','k+');
traj = mybspline(Cpts);
plot(traj(:,1),traj(:,2),'b-','LineWidth', 2);

for i = 5:size(points,1) -3
    for j = 5: size(Cpts,1)-3
        if norm(points(i,:)-Cpts(j,:)) < 10.0
            grad = findmapDirection(points(i,:),Imp);
            Cpts(j-2:j+1,:) = bsplineN2(Cpts(j-2:j+1,:),grad,5);
        end
    end
end

plot(Cpts(:,1)',Cpts(:,2)','k+');
traj = mybspline(Cpts);
plot(traj(:,1),traj(:,2),'g-','LineWidth', 2);


