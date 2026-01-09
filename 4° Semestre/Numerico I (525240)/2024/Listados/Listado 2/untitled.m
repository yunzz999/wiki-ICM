n=input("ingrese la cantidad de puntos");
x=1:1:n;
y=eulerPhi(x);
t=1:1:5*n;
tt=eulerPhi(t);

p=polyfit(t,tt,(5*n)-1);
q=spline(t,tt);

plot(t,tt,"r*")
hold on
plot(t,polyval(p,t),"b")
hold on
plot(t,ppval(q,t),"k")
