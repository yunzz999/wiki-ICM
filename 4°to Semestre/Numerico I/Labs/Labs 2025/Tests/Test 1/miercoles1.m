f=@(x) atan(x);

xx=linspace(-10,10,8);
yy=f(xx);
n=7;
p=polyfit(xx,yy,n);
coef1=p(n-2);
coef2=p(n);
s=spline(xx,yy);
e1=abs(f(1)-polyval(p,1));
e2=abs(f(1)-ppval(s,1));
val=0;

plot(xx,yy,"r*")
hold on
plot(xx,polyval(p,xx),"b")
plot(xx,ppval(s,xx),"y--") 