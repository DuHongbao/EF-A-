clc
clear all; close all;

x_I=10; y_I=10;           
x_G=195; y_G=360;       


Delta_t= 0.5;
k_v= 0.05;
k_theta=0.01;

theta= 3.14*0.3;
LOS=0;
v_x=0;
v_y=0;

%% 
figure(1);
ImpRgb=imread('newmap3.png');
Imp=rgb2gray(ImpRgb);
imshow(Imp)
xL=size(Imp,2);%地图x轴长度
yL=size(Imp,1);%地图y轴长度
hold on
plot(x_I, y_I, 'ro', 'MarkerSize',10, 'MarkerFaceColor','r');
plot(x_G, y_G, 'go', 'MarkerSize',10, 'MarkerFaceColor','g');% 绘制起点和目标点
count=1;
bFind = false;

%% 定义障碍物
%障碍速度的方向
theta_obs=3.14*0.25;
r=17;
a=20;b=20;k=0.3;
x_obs=[];y_obs=[];
x_obs(1)=60;
y_obs(1)=70;
obstacle_1=zeros(3,5)
%plot(x_obs,y_obs,'o', 'MarkerSize',r, 'MarkerFaceColor','b');

% alpha=0:pi/20:2*pi;%角度bai[0,2*pi]
% 
% x=x_obs(1)+r*cos(alpha);
% y=y_obs(1)+r*sin(alpha);
% x_1=a*cos(alpha);
% y_1=b*sin(alpha)./(1-k*sin(alpha));
% x1_1=x_1;
% x_1 = x_1.*cos(theta_obs)-y_1.*sin(theta_obs)+x_obs(1);
% y_1 = x1_1.*sin(theta_obs)+y_1.*cos(theta_obs)+y_obs(1);
% plot(x_obs(1),y_obs(1),'-');
% %plot(x,y,'-');
% %plot_1 = plot(x_1,y_1,'-');
% %plot_1.Color(1)=0.5;
% patch(x,y,'r','edgecolor','none','facealpha',0.15);
% patch(x_1,y_1,'b','edgecolor','none','facealpha',0.15);
obstacle_1(1,:) = add_obstacle(20,[60,90], 0, 0);
obstacle_1(2,:) = add_obstacle(20,[130,180], 0, 0)
obstacle_1(3,:) = add_obstacle(20,[150,280], 0, 0)
%% 构建矩阵 障碍物构成的圆新(x,y) (80 ,110); 障碍曲线方程为：(x-x_o)^2+(y-y_o)^2 - r^2=0
%调制矩阵M=EDE'   
%f_sphere=(x-x_obs(1))^2+(y-y_obs(1))^2-r^2;
%E=2*[x-x_obs(1), y-y_obs(1);y-y_obs(1),y-y_obs(1)];
%D=[1-1/abs(f_sphere) 0; 0 1-1/abs(f_sphere)];



%% DS调制法
x_n=[];
y_n=[];
x_n(1)=x_I;
y_n(1)=y_I;
count=1;
for iter = 1:3000
   if((x_G - x_n(count))<5 &&(y_G - y_n(count))<5)
       break
   end
   LOS = atan((y_G - y_n(count)) / (x_G - x_n(count)));
   theta = theta - k_theta*(theta- LOS);
   v_x=2*cos(theta);
   v_y=2*sin(theta);

   %%%%%%%
   delta_d=[x_n(count);y_n(count)]-[x_obs(1);y_obs(1)];
   delta_d=delta_d/norm(delta_d);
   x_sph= x_obs(1)+r*delta_d(1);
   y_sph= y_obs(1)+r*delta_d(2);
   f_sphere=sqrt(((x_n(count)-x_obs)^2+(y_n(count)-y_obs)^2)/r^2);
   %蛋形曲线对应调制矩阵
   %E=2*[(x_n(count)-x_obs(1))/a^2 , (y_n(count)-y_obs(1))/(b+k*(y_n(count)-y_obs(1)))^2-k*(y_n(count)-y_obs(1))^2/(b+k*(y_n(count)-y_obs(1)))^3;(y_n(count)-y_obs(1))/(b+k*(y_n(count)-y_obs(1)))^2-k*(y_n(count)-y_obs(1))^2/(b+k*(y_n(count)-y_obs(1)))^3, -(x_n(count)-x_obs(1))/a^2];
   
   %E=2*[x_sph-x_obs(1), y_sph-y_obs(1);0 ,-y_sph+y_obs(1)];
   %E=2*[x_n(count)-x_obs(1), y_n(count)-y_obs(1); (y_n(count)-y_obs(1))^1, -x_n(count)+x_obs(1)  ];
   %E=2*[x_n(count)-x_sph, y_n(count)-y_sph; y_n(count)-y_sph , -x_n(count)+x_sph ];
   %D=[1-1/abs(f_sphere+1)^0.5 0; 0 1+1/abs(f_sphere+1)^0.5];
   %D=[1-1/abs(f_sphere+1)^0.5 0; 0 1+1/abs(f_sphere+1)^0.9];
   %M=E*D/E;
   robot_pos=[x_n(count),y_n(count)];
   M=get_M(robot_pos,obstacle_1);

   v=[v_x;v_y];
   v_x =M(1,:)*[v_x;v_y];
   v_y =M(2,:)*v;


   %%%%%%%%%%%
  
   x_n(count+1) =  x_n(count)  + v_x * Delta_t;
   y_n(count+1) =  y_n(count)  + v_y * Delta_t;
   
   count = count + 1;
end
plot(x_n,y_n,'--','color','g', 'LineWidth',1.5, 'MarkerSize',5, 'MarkerFaceColor','r');
%plot(x_G, y_G, 'go', 'MarkerSize',10, 'MarkerFaceColor','g');% 绘制起点和目标点













