x=[0,20,40];
y=[10,20,30];


p=polyfit(x,y,2);
xx=linspace(0,60,100);
plot(xx,polyval(p,xx),"r")

tt=[0,20,40,5,35];
polyval(p,tt)