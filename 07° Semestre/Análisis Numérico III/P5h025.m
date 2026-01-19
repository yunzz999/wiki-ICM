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
grid on
legend('Solución exacta','Aproximación')
title('Aproximacion mediante ecuacion en diferencias')
xlabel('x')
ylabel('y(x)')
ylim([-4,4])