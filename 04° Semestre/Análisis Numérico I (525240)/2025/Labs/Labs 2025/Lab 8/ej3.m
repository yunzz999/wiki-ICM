k=1;
R=1;
m=1;
f=@(t) sin(pi*t);

z1p=@(t,z1,z2)  1/m*(f(t) - k*z2-R*z1);

z2p=@(t,z1,z2) z1;



x0=1;
x1=0;
N=100;

[parte,z1se,z2se]=euler_explicito_2orden(0,20,z1p,z2p,x1,x0,N);

plot(parte,z2se,"m-")
grid on;
legend("Euler Explicito")

