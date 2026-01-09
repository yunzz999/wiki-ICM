clear all;
% h = 0.005
ysol = @(t) t*exp(-t);
a = 1/2; b = 3;
f = @(t,y) (1-t)*y/t;
y0 = (1/2)*exp(-1/2);
h2 = 0.05;
n2 = (b-a)/h2;
[x2,yRKK42] = RK44(f,y0,a,b,n2);
h2 = 0.05;
y2 = [];
t2 = a:h2:b;
y2(1) = y0;
y2(2) =  yRKK42(2);
y2(3) =  yRKK42(3);
yp2(1) = y2(1);
yp2(2) =  y2(2);
yp2(3) =  y2(3);
for i = 3:length(t2)-1
   yp2(i+1) = yp2(i) + (h2/12)*(23*f(t2(i),yp2(i))-16*f(t2(i-1),yp2(i-1)) + 5*f(t2(i-2),yp2(i-2)));
   y2(i+1) = y2(i) + (h2/24)*(9*f(t2(i+1),yp2(i+1)) + 19*f(t2(i),y2(i))-5*f(t2(i-1),y2(i-1)) + f(t2(i-2),y2(i-2)));
end 
fplot(ysol)
hold on
plot(t2,y2,'*')
grid on
legend('Solución exacta','Aproximación')
title('Aproximacion mediante predictor-corrector')
xlabel('t')
ylabel('y(t)')
ylim([0,1])
xlim([0,4])