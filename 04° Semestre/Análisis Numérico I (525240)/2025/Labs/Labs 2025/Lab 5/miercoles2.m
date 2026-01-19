t=(0.5:0.5:4.5)';
A=t.^(0:2);
yy=[1.8,2.4,3.7,5.9,9.2,14.1,21.5,32.8,49.5]';
b=log(yy);
x=A\b;
alpha=x(1)
beta=x(2)
gamma=x(3)
r=norm(A*x-b)
g=@(t) exp(alpha+beta.*t+gamma.*t.^2);
prediccion=g(5);


tt=linspace(0.5,6,100);
plot(t,yy,"r*");
hold on
plot(t,b,"b^")
hold on
plot(tt,g(tt),"g")
hold on
plot(tt,log(g(tt)),"m")
hold on
plot(5,g(5),"kd")
legend("Datos iniciales","Datos Lineales","Modelo Exponencial","Modelo Lineal")