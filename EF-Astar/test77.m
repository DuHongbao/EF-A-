clear;
clc;

f = [];
y= 0:0.5:15;
for d= 0:0.5:15
    x = 0.01*d^2-0.304*d + 2.33;
    f = [f,x];
end
plot(y,f,'g*-','LineWidth',2);

hold on

f = [];
y= 0:0.5:22;
for d= 0:0.5:22
    x = 0.009*d^2-0.184*d + 1.23;
    f = [f,x];
end
plot(y,f,'b*-','LineWidth',3);


f = [];
y= 0:0.5:8;
for d= 0:0.5:8
    x = 0.009*d^2-0.222*d + 1.23;
    f = [f,x];
end
plot(y,f,'b+:','LineWidth',3);

f = [];
y= 0:0.5:22;
for d= 0:0.5:22
    x = -2.36/(1+2.34*exp(-0.4*(d-10.4)))+2.35;
    f = [f,x];
end
plot(y,f,'r*-','LineWidth',2);

f = [];
y= 0:0.5:22;
for d= 0:0.5:22
    x = 1;
    f = [f,x];
end
plot(y,f,'k+-','LineWidth',2);






