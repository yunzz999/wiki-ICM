clear all;
% h = 0.1
ysol = @(t) t*exp(-t);
a = 1/2; b = 3;
f = @(t,y) (1-t)*y/t;
y0 = (1/2)*exp(-1/2);
h1 = 0.1;
n1 = (b-a)/h1;
[x1,yRKK441] = RK44(f,y0,a,b,n1);
y1 = [];
t1 = a:h1:b;
y1(1) = y0;
y1(2) =  yRKK441(2);
y1(3) =  yRKK441(3);
yp1(1) = y1(1);
yp1(2) =  y1(2);
yp1(3) =  y1(3);
for i = 3:length(t1)-1
   yp1(i+1) = yp1(i) + (h1/12)*(23*f(t1(i),yp1(i))-16*f(t1(i-1),yp1(i-1)) + 5*f(t1(i-2),yp1(i-2)));
   y1(i+1) = y1(i) + (h1/24)*(9*f(t1(i+1),yp1(i+1)) + 19*f(t1(i),y1(i))-5*f(t1(i-1),y1(i-1)) + f(t1(i-2),y1(i-2)));
end 
fplot(ysol)
hold on
plot(t1,y1,'*')
grid on
legend('Solución exacta','Aproximación')
title('Aproximacion mediante predictor-corrector')
xlabel('t')
ylabel('y(t)')
ylim([0,1])
xlim([0,4])
