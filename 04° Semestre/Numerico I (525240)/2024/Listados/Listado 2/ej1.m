n=input('Ingresa un número: ');
x=zeros(n,1);
y=zeros(n,1);
for i=1:n
    x(i)=input('Ingresa x: ');
    y(i)=input('Ingresa un y: ');
end

p=polyfit(x,y,n-1);
q=spline(x,y);

xx=linspace(min(x),max(x),(max(x)-min(x))*10);
plot(xx,polyval(p,xx),"r")
hold on
plot(xx,ppval(q,xx),"b")
legend("p(x)","q(x)")