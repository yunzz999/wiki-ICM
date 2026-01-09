ysol = @(x) [-x^2 - 2*x + 1 + 2*exp(x)];
f = @(x,y) [y + x^2 - 3];
y0 = 3;a = 0;b = 1;
% h = 0.1
h = 0.1;
x = a:h:b;
y1 = [];
y1(1) = y0;
% Euler explicito
for i = 2:length(x)
    y1(i) = y1(i-1) + h*f(x(i-1),y1(i-1));
end
fplot(ysol)
hold on
plot(x,y1,'*')
grid on
legend('Solucion exacta','Aproximacion')
title('Aproximacion mediante Euler explícito')
ylim([3,3.5]);
xlim([0,1]);
hold off
% Mejorado
y = [];
y(1) = y0;
for i = 2:length(x)
   y(i) = y(i-1) + (h/2)*(f(x(i-1),y(i-1)) + f(x(i),y(i-1) + h*f(x(i-1),y(i-1)))); 
end    
fplot(ysol)
hold on
plot(x,y,'*')
grid on
legend('Solucion exacta','Aproximacion')
title('Aproximacion mediante Euler explícito mejorado')
ylim([3,3.5]);
xlim([0,1]);
hold off
% Modificado
y2 = [];
y2(1) = y0;
for i = 2:length(x)
   y2(i) = y2(i-1) + h*f(x(i-1) + h/2,y(i-1) + (h/2)*f(x(i-1),y(i-1))); 
end  
fplot(ysol)
hold on
plot(x,y2,'*')
grid on
legend('Solucion exacta','Aproximacion')
title('Aproximacion mediante Euler explícito modificado')
ylim([3,3.5]);
xlim([0,1]);
hold off