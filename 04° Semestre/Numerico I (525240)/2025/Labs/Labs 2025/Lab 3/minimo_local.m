f   = @(x) (x-4).*sqrt(x);
df  = @(x) (x - 4)./(2*sqrt(x)) + sqrt(x);
dff = @(x) 1./sqrt(x) - (x - 4)./(4*x.^(3/2));


[aprox,iter]=newton_raphson(df,dff,1,1e-6,30);
points=linspace(0,2,200);
y=f(aprox);
plot(points,f(points),"r--")
hold on
plot(aprox,f(aprox),"ko");
hold on
grid on
fplot(y,[0,2],"gx")