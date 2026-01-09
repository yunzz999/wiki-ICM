clear all;close all;clc;
x0 = linspace(-6,-4);
y0 = zeros(1,100);
x1 = linspace(-4,-3);
y1 = (1/2)*(1 + sin((x1 + 4)/pi)) + (1/8)*(x1 + 4 + pi - pi*cos((x1+4)/pi));
x2 = linspace(-3,4);
y2 = (1/8)*(1-pi*cos(1/pi) + pi)*ones(1,100);
x3 = linspace(4,5);
y3 = (1/2)*(1+sin((x3-4)/pi)) + (1/8)*(5 + pi*cos((x3-4)/pi) - pi*cos(1/pi) - x3);
x4 = linspace(5,6);
y4 = zeros(1,100);
x = [x0,x1,x2,x3,x4];
y = [y0,y1,y2,y3,y4];
plot(x,y,'LineWidth',1.4)
str = 'Solución de la ecuación de la onda para t = 2';
title(str,'interpreter','latex')
legend('$u(x,2)$','interpreter','latex')
grid on