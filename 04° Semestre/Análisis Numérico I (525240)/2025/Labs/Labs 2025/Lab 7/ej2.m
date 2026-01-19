solucion=@(x) exp(-10*x)+1;
f=@(x,y) 10*(1-y);
y_0=2;
n=100;
[t,y]=ode45(f,[0 2],2);

[ex_x,ex_y]=euler_explicito(0,2,f,y_0,n);
[im_x,im_y]=euler_implicito(0,2,f,y_0,n);
plot(ex_x,solucion(ex_x),"r")
hold on
plot(ex_x,ex_y,"b--")
hold on
plot(im_x,im_y,"m--");
hold on
plot(t,y,"y")
grid on
legend("Solucion","Explicito","Implicito")