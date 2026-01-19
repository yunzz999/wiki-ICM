x=[1,2,3];
y=log(x);

z=linspace(1,3,200);
p=polyfit(x,y,2);



f=@(x) abs(log(x)-polyval(p,x));
g=@(x) (2/3).*(x-1).*(x-2).*(x-3);
z2=linspace(1,2,50);

plot(z2,f(z2),"r")
hold on
plot(z2,g(z2),"b--")

%3 si se cumple.