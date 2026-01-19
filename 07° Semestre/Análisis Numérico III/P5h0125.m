clear all;close all;clc;
ysol = @(x) sin(x) + cos(x);
f = @(x,y) [y - 2*sin(x)];
a = 0;
b = 4;
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
grid on
legend('Solución exacta','Aproximación')
title('Aproximacion mediante ecuacion en diferencias')
xlabel('x')
ylabel('y(x)')