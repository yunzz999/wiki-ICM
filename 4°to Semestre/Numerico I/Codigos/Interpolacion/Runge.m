campana = @(x) 1./(1+x.^2);
x=linspace(-5,5,1000);
y=campana(x);
xx=linspace(-5,5,11);
yy=campana(xx);
yl=lagrange(x,xx,yy);
plot(x,y,x,yl)
% ys=spline(xx,yy,x);
% plot(x,y,x,ys)