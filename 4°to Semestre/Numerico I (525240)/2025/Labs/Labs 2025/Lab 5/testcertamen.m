x=[1978,1982,1990];
y=[60,80,170];

p=polyfit(x,y,2);
xx=linspace(1950,2000,1000);
polyval(p,1986)
plot(xx,polyval(p,xx),"r")
legend("p(x)")