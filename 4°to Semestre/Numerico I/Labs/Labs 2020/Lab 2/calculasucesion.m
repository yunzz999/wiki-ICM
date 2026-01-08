a=input("ingrese a: ");
x0=input("ingrese x0: ");
n=input("Ingrese n: ");

vec=sucesionlab2(a,x0,n);

x=linspace(1,n,n);
y1=vec(x);

x2 = 0:0.1:10;    % Valores de x
y2 = (1/a)* ones(size(x2));

plot(x,y1,'r');
hold on;
plot(x2,y2,'b--');
grid on;
error=abs(vec(end)-1/a);
disp(["el error absoluto es ",error])