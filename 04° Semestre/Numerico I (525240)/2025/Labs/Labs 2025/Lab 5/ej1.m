x=[0,1,2,3,4,5,6,7,8]';
m=2;
A=x.^(1:m);
y=[12,10.5,10,8,7,8,7.5,8.5,9]';
sol=A'*y\A'*A;

valores=linspace(0,8,100);
plot(x,y,"r*")
hold on;
plot(valores,polyval(sol,valores),"b--")