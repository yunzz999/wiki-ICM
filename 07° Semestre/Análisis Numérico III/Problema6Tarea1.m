clear all;
ysol = @(t) t*exp(-t);
a = 1/2; b = 3;
f = @(t,y) (1-t)*y/t;
y0 = (1/2)*exp(-1/2);
% h = 0.25
h = 1/4;
n = (b-a)/h;
[x,y] = RK44(f,y0,a,b,n);
fplot(ysol);
hold on
plot(x,y,'*');
ylim([0,1])
xlim([0,4])
% h = 0.1
h1 = 0.1;
n1 = (b-a)/h1;
[x1,y1] = RK44(f,y0,a,b,n1);
fplot(ysol);
hold on
plot(x1,y1,'*');
ylim([0,1])
xlim([0,4])
% h = 0.05
h2 = 0.05;
n2 = (b-a)/h2;
[x2,y2] = RK44(f,y0,a,b,n2);
fplot(ysol);
hold on
plot(x2,y2,'*');
ylim([0,1])
xlim([0,4])