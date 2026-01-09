x=[1,2,3,4,5];
y=[1,1,2,6,24];

p=polyfit(x,y,4);
s=spline(x,[0 y 0]);
z1=linspace(1,2,300);


plot(z1,polyval(p,z1),"r")
hold on
plot(z1,gamma(z1),"b--")
hold on
plot(z1,ppval(s,z1),"g--")

legend("p(x)","\Gamma(x)","s(x)")

%interpola mejor polyfit?

%en [1,2] la spline 