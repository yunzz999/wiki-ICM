x=@(t) 5*cos(t);
y=@(t) 3*sin(t);
y1=@(t) 5*sin(t);
h=@(t) sqrt((-5*sin(t)).^2 + (3*cos(t)).^2);

tt=linspace(-pi,pi,200);
plot(x(tt),y(tt),"b--")
hold on
plot(x(tt),y1(tt),"r--")
simpson(-pi,pi,h,100)
grid on