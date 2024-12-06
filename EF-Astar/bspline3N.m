clc;clear;
Q0 = 1.8;
Q1 = 1.2;
Q2 = 2.4;
Q3 = 0.7;

i= 0:0.1:4;
C_u = [];

for u=0:0.1:0.9
    temp = u^3/6;
    C_u = [C_u,temp];
end

for u=1:0.1:1.9
    temp = -u^3/2 + 2*u^2-2*u+2/3;
    C_u = [C_u,temp];
end

for u=2:0.1:2.9
    temp = u^3/2 - 4*u^2 + 10*u-22/3;
    %temp = 0;
    C_u = [C_u,temp];
end

for u=3:0.1:4
    temp = -u^3/6 + 2*u^2 - 8*u + 32/3;
    C_u = [C_u,temp];
end

hold on
plot(i,C_u,'r*-','LineWidth',3);

% 
i= 1:0.1:5;
C_u = [];

for u=1:0.1:1.9
    temp = (u-1)^3/6;
    C_u = [C_u,temp];
end

for u=2:0.1:2.9
    temp = -(u-1)^3/2 + 2*(u-1)^2-2*(u-1)+2/3;
    C_u = [C_u,temp];
end

for u=3:0.1:3.9
    temp = (u-1)^3/2 - 4*(u-1)^2 + 10*(u-1)-22/3;
    %temp = 0;
    C_u = [C_u,temp];
end

for u=4:0.1:5
    temp = -(u-1)^3/6 + 2*(u-1)^2 - 8*(u-1) + 32/3;
    C_u = [C_u,temp];
end

hold on
plot(i,C_u,'g*-','LineWidth',3);




i= 2:0.1:6;
C_u = [];

for u=2:0.1:2.9
    temp = (u-2)^3/6;
    C_u = [C_u,temp];
end

for u=3:0.1:3.9
    temp = -(u-2)^3/2 + 2*(u-2)^2-2*(u-2)+2/3;
    C_u = [C_u,temp];
end

for u=4:0.1:4.9
    temp = (u-2)^3/2 - 4*(u-2)^2 + 10*(u-2)-22/3;
    %temp = 0;
    C_u = [C_u,temp];
end

for u=5:0.1:6
    temp = -(u-2)^3/6 + 2*(u-2)^2 - 8*(u-2) + 32/3;
    C_u = [C_u,temp];
end

hold on
plot(i,C_u,'b*-','LineWidth',3);


i= 3:0.1:7;
C_u = [];

for u=3:0.1:3.9
    temp = (u-3)^3/6;
    C_u = [C_u,temp];
end

for u=4:0.1:4.9
    temp = -(u-3)^3/2 + 2*(u-3)^2-2*(u-3)+2/3;
    C_u = [C_u,temp];
end

for u=5:0.1:5.9
    temp = (u-3)^3/2 - 4*(u-3)^2 + 10*(u-3)-22/3;
    %temp = 0;
    C_u = [C_u,temp];
end

for u=6:0.1:7
    temp = -(u-3)^3/6 + 2*(u-3)^2 - 8*(u-3) + 32/3;
    C_u = [C_u,temp];
end

hold on
plot(i,C_u,'c*-','LineWidth',3);


i= 4:0.1:8;
C_u = [];

for u=4:0.1:4.9
    temp = (u-4)^3/6;
    C_u = [C_u,temp];
end

for u=5:0.1:5.9
    temp = -(u-4)^3/2 + 2*(u-4)^2-2*(u-4)+2/3;
    C_u = [C_u,temp];
end

for u=6:0.1:6.9
    temp = (u-4)^3/2 - 4*(u-4)^2 + 10*(u-4)-22/3;
    %temp = 0;
    C_u = [C_u,temp];
end

for u=7:0.1:8
    temp = -(u-4)^3/6 + 2*(u-4)^2 - 8*(u-4) + 32/3;
    C_u = [C_u,temp];
end

hold on
plot(i,C_u,'m*-','LineWidth',3);



%%%%%%%%%%%%%%%%%%%%
% 
% 
% i= 0:0.1:3;
% C_u = [];
% 
% for u=0:0.1:0.9
%     temp = u^2/2;
%     C_u = [C_u,temp];
% end
% 
% for u=1:0.1:1.9
%     temp = -u^2 + 3*u-3/2;
%     C_u = [C_u,temp];
% end
% 
% for u=2:0.1:3
%     temp = u^2/2 - 3*u + 9/2;
%     %temp = 0;
%     C_u = [C_u,temp];
% end
% 
% 
% 
% hold on
% plot(i,C_u,'g:','LineWidth',2);
% 
% 
% 
% i= 1:0.1:4;
% C_u = [];
% 
% for u=1:0.1:1.9
%     temp = (u-1)^2/2;
%     C_u = [C_u,temp];
% end
% 
% for u=2:0.1:2.9
%     temp = -(u-1)^2 + 3*(u-1)-3/2;
%     C_u = [C_u,temp];
% end
% 
% for u=3:0.1:4
%     temp = (u-1)^2/2 - 3*(u-1) + 9/2;
%     %temp = 0;
%     C_u = [C_u,temp];
% end
% 
% 
% 
% hold on
% plot(i,C_u,'g:','LineWidth',2);
% 
% 
% i= 2:0.1:5;
% C_u = [];
% 
% for u=2:0.1:2.9
%     temp = (u-2)^2/2;
%     C_u = [C_u,temp];
% end
% 
% for u=3:0.1:3.9
%     temp = -(u-2)^2 + 3*(u-2)-3/2;
%     C_u = [C_u,temp];
% end
% 
% for u=4:0.1:5
%     temp = (u-2)^2/2 - 3*(u-2) + 9/2;
%     %temp = 0;
%     C_u = [C_u,temp];
% end
% 
% 
% 
% hold on
% plot(i,C_u,'g:','LineWidth',2);
% 
% 
% 
% i= 3:0.1:6;
% C_u = [];
% 
% for u=3:0.1:3.9
%     temp = (u-3)^2/2;
%     C_u = [C_u,temp];
% end
% 
% for u=4:0.1:4.9
%     temp = -(u-3)^2 + 3*(u-3)-3/2;
%     C_u = [C_u,temp];
% end
% 
% for u=5:0.1:6
%     temp = (u-3)^2/2 - 3*(u-3) + 9/2;
%     %temp = 0;
%     C_u = [C_u,temp];
% end
% 
% 
% 
% hold on
% plot(i,C_u,'g:','LineWidth',2);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% i= 0:0.1:2;
% C_u = [];
% 
% for u=0:0.1:0.9
%     temp = u;
%     C_u = [C_u,temp];
% end
% 
% for u=1:0.1:2
%     temp = 2-u;
%     C_u = [C_u,temp];
% end
% hold on
% plot(i,C_u,'r-.','LineWidth',1);
% 
% 
% i= 1:0.1:3;
% C_u = [];
% 
% for u=1:0.1:1.9
%     temp = u-1;
%     C_u = [C_u,temp];
% end
% 
% for u=2:0.1:3
%     temp = 2-(u-1);
%     C_u = [C_u,temp];
% end
% hold on
% plot(i,C_u,'r-.','LineWidth',1);
% 
% 
% i= 2:0.1:4;
% C_u = [];
% 
% for u=2:0.1:2.9
%     temp = u-2;
%     C_u = [C_u,temp];
% end
% 
% for u=3:0.1:4
%     temp = 2-(u-2);
%     C_u = [C_u,temp];
% end
% 
% 
% hold on
% plot(i,C_u,'r-.','LineWidth',1);
% 
% i= 3:0.1:5;
% C_u = [];
% 
% for u=3:0.1:3.9
%     temp = u-3;
%     C_u = [C_u,temp];
% end
% 
% for u=4:0.1:5
%     temp = 2-(u-3);
%     C_u = [C_u,temp];
% end
% 
% 
% hold on
% plot(i,C_u,'r-.','LineWidth',1);
% 
% 
% i= 4:0.1:6;
% C_u = [];
% 
% for u=4:0.1:4.9
%     temp = u-4;
%     C_u = [C_u,temp];
% end
% 
% for u=5:0.1:6
%     temp = 2-(u-4);
%     C_u = [C_u,temp];
% end
% 
% 
% hold on
% plot(i,C_u,'r-.','LineWidth',1);
% 
% 
