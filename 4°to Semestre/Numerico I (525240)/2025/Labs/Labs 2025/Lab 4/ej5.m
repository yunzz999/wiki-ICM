x=[0.9,1.3,1.9,2.1,2.6,3,3.9,4.4,4.7,5,6,7,8,9.2,10.5,11.3,11.6,12,12.6,13,13.3];
y=[1.3,1.5,1.85,2.1,2.6,2.7,2.4,2.15,2.05,2.1,2.25,2.3,2.25,1.95,1.4,0.9,0.7,0.6,0.5,0.4,0.25];

p=polyfit(x,y,20);
s=spline(x,y);

z1=linspace(0.9,13.3,100);
plot(z1,polyval(p,z1),"r")
hold on
plot(z1,ppval(s,z1),"b")
hold on
plot(x,y,"k*")
legend("p(x)","s(x)","points")

%se obtiene una aproximacion insanamente mejor xd