clear all;close all;clc;
ysol = @(x) sin(x) + cos(x);
f = @(x,y) [y - 2*sin(x)];
a = 0;
b = 4;
%Caso h = 1/4
h1 = 1/4;
n1 = (b-a)/h1;
x1 = [];
y1 = [];
y1(1) = 1;
y1(2) = sin(h1) + cos(h1);
x1 = a:h1:b;
for i = 1:n1-1
  y1(i+2) = -4*y1(i+1)+5*y1(i) + h1*(4*f(x1(i+1),y1(i+1)) + 2*f(x1(i),y1(i)));  
end  
fplot(ysol,[0,4])
hold on
plot(x1,y1)
ylim([-4,4])
%Caso h = 1/8
h2 = 1/8;
n2 = (b-a)/h2;
x2 = [];
y2 = [];
y2(1) = 1;
y2(2) = sin(h2) + cos(h2);
x2 = a:h2:b;
for i = 1:n2-1
  y2(i+2) = -4*y2(i+1)+5*y2(i) + h2*(4*f(x2(i+1),y2(i+1)) + 2*f(x2(i),y2(i)));  
end  
fplot(ysol,[0,4])
hold on
plot(x2,y2)
ylim([-4,4])
%Caso h = 1/16
h3 = 1/16;
n3 = (b-a)/h3;
x3 = [];
y3 = [];
y3(1) = 1;
y3(2) = sin(h3) + cos(h3);
x3 = a:h3:b;
for i = 1:n3-1
  y3(i+2) = -4*y3(i+1)+5*y3(i) + h3*(4*f(x3(i+1),y3(i+1)) + 2*f(x3(i),y3(i)));  
end  
fplot(ysol,[0,4])
hold on
plot(x3,y3)
ylim([-4,4])