x=[300,400,500,600,700,800,900,1000,1100];
y=[0.024,0.035,0.046,0.058,0.067,0.083,0.097,0.111,0.125];

p=polyfit(x,y,8);
p1=polyval(p,550);
p2=polyval(p,750);
p3=polyval(p,1080);
s=spline(x,[0 y 0]);
s1=ppval(s,550);
s2=ppval(s,750);
s3=ppval(s,1080);



z1=linspace(300,1100,1000);
plot(z1,polyval(p,z1),"r");
hold on
plot(z1,ppval(s,z1),"b")
hold on
plot(x,y,"k*")
legend("p(x)","s(x)","puntos")
abs(p1-s1)
abs(p2-s2)
abs(p3-s3)