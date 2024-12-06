clc;clear;
Q0 = 1.8;
Q1 = 1.2;
Q2 = 2.4;
Q3 = 0.7;

i= 0:0.1:1;
C_u = [];

for u=0:0.1:1
    C_u = [C_u,Q0*u^2/2];
end
hold on
plot(i,C_u,'r*-','LineWidth',2);

i= 1:0.1:2;
C_u = [];
for u=1:0.1:2
    temp = (-u^2+3*u-1.5)*Q0 + 0.5*(u-1)^2*Q1;
    C_u = [C_u,temp];
end
hold on
plot(i,C_u,'r*-','LineWidth',2);


i= 2:0.1:3;
C_u = [];
for u=2:0.1:3
    temp = (0.5*u^2-3*u+4.5)*Q0 + (-(u-1)^2+3*(u-1)-1.5)*Q1 + 0.5*(u-2)^2*Q2;
    C_u = [C_u,temp];
end
hold on
plot(i,C_u,'r*-','LineWidth',2);


i= 3:0.1:4;
C_u = [];
for u=3:0.1:4
    temp = (0.5*(u-1)^2-3*(u-1)+4.5)*Q1 + (-(u-2)^2+3*(u-2)-1.5)*Q2 + 0.5*(u-3)*Q3;
    C_u = [C_u,temp];
end
hold on
plot(i,C_u,'r*-','LineWidth',2);

% 
% i= 4:0.1:5;
% C_u = [];
% for u=4:0.1:5
%     temp = (0.5*(u-2)^2-3*(u-2)+4.5)*Q2 ;
%     C_u = [C_u,temp];
% end
% hold on
% plot(i,C_u,'c*-','LineWidth',3);



