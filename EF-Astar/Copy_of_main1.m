clc;clear;%close all;
img = imread('result41.png'); % 读取图像


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
 startPoint = [540,950.0];
 %startPoint = [287,157.0];
 targetPoint = [2009.0,2106.0];
 %targetPoint = [3690.0,2146.0];

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
   
    plot([a(1), b(1)], [a(2), b(2)], 'Color', [1, 0, 0], 'LineWidth', 3); 
end


toc
Qx = [targetPoint(1), targetPoint(1), targetPoint(1), Qx,80,80,80];
Qy = [targetPoint(2), targetPoint(2), targetPoint(2), Qy,1000,1000,1000];







