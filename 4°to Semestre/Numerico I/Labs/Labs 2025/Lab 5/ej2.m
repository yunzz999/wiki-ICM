x=[1,2,5,15,25,30,35,40]';
y=[99,95,85,55,30,24,20,15]';
A=x.^(0:2);

Y=log(y);
sol=A\Y;
alpha=exp(sol(1))
beta=exp(sol(2))
p=[beta,alpha];
datos=linspace(0,40,200);

plot(x,y,"r*")
hold on
plot(x,Y,"b*")
hold on
plot(datos,polyval(p,datos),"k")