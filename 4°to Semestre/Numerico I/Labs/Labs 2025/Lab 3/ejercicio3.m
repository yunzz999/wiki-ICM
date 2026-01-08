G=@(x) x.*sin(x)+cos(x)-5;
dG=@(x)x*cos(x);

[aprox,iter]=newton_raphson(G,dG,6,1e-6,100);
aprox
iter
G(aprox)