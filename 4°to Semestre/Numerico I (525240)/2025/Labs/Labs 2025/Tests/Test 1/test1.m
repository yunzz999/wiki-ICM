f=@(x) tanh(x);

xx=linspace(-4,4,10)
yy=tanh(xx)

n=9
p=polyfit(xx,yy,n)
coef1=p(n-4)
coef2=p(n)
s=spline(xx,[0 yy 0]);
e1=abs(f(3)-polyval(p,3))
e2=abs(f(3)-ppval(s,3))
val=2
