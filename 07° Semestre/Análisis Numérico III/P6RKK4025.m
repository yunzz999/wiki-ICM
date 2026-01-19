clear all;
% h = 0.25
ysol = @(t) t*exp(-t);
a = 1/2; b = 3;
f = @(t,y) (1-t)*y/t;
y0 = (1/2)*exp(-1/2);
h = 1/4;
n = (b-a)/h;
[x,yRK44] = RK44(f,y0,a,b,n);
y = [];
t = a:h:b;
y(1) = y0;
y(2) = yRK44(2);
y(3) = yRK44(3);
yp(1) = y(1);
yp(2) =  y(2);
yp(3) =  y(3);
for i = 3:length(t)-1
   yp(i+1) = yp(i) + (h/12)*(23*f(t(i),yp(i))-16*f(t(i-1),yp(i-1)) + 5*f(t(i-2),yp(i-2)));
   y(i+1) = y(i) + (h/24)*(9*f(t(i+1),yp(i+1)) + 19*f(t(i),y(i))-5*f(t(i-1),y(i-1)) + f(t(i-2),y(i-2)));
end 
fplot(ysol)
hold on
plot(t,y,'*')
grid on
legend('Solución exacta','Aproximación')
title('Aproximacion mediante predictor-corrector')
xlabel('t')
ylabel('y(t)')
ylim([0,1])
xlim([0,4])