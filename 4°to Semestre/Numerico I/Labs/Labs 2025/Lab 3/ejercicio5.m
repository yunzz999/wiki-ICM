%Encontrar Puntos Criticos
f=@(x,y) 2.*x.^2.*y^2+x.^2.*y-2.*x-y.^2;

f1=@(x,y)4*y^2*x+2*x*y-2;
dxf1=@(x,y)4*y^2+2*y;
dyf1=@(x,y) 8*x*y+2*x;

f2=@(x,y) 4*x^2*y+x^2-2*y;
dxf2=@(x,y) 8*x*y+2*x;
dyf2=@(x,y) 4*x^2-2;

[aprox,iter]=newton2D(f1,f2,dxf1,dyf1,dxf2,dyf2,[1,10],1e-6,1000);
aprox;
iter;

x=linspace(-10,10,100);
y=linspace(-10,10,100);

plot(x,y,f(x,y),"r");
