a=input("ingrese a: ");
x0=input("ingrese x0: ");
n=input("Ingrese n: ");

v=sucesionlab22(a,x0,n);

x1=1:n;
y1=v;

x2=0:0.1:10;
y2=sqrt(a)*ones(size(x2));

plot(x1,y1,'r')
hold on;
plot(x2,y2,'b--');

error=abs(sqrt(a)-v(end));
disp(["El error absoluto es: ",error]);
