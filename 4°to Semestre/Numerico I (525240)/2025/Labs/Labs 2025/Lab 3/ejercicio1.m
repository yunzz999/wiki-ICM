
f=@(x) x^3+2*x-8;
df=@(x) 3*x^2+2;
g=@(x) 2*x^3-sin(x^2+1)-x;
h=@(x)exp(cos(x+1))-1;
y=0;

fplot(f,[-3,3],"b")
hold on
fplot(g,[-3,3],"r")
hold on
fplot(h,[-3,3],"c")
hold on
grid on
fplot(y,[-3,3],"k")

[res,iter]=biseccion(f,-3,3,1e-6);
[res2,iter2]=newton_raphson(f,df,-3,3,1e-6);
res
res2
iter
iter2

