clear all;close all;clc;
ysol = @(x) sin(x) + cos(x);
f = @(x,y) [y - 2*sin(x)];
a = 0;
b = 4;
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
grid on
legend('Solución exacta','Aproximación')
title('Aproximacion mediante ecuacion en diferencias')
xlabel('x')
ylabel('y(x)')