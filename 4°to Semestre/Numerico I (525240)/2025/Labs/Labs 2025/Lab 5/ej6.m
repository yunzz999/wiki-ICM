t=[0.25,1,1.5,2.5,7.5]';
y=[-10.8,13.5,16.4,28.7,51.3]';


A=[ones(size(t)),log10(t)];

x=A'*A\A'*Y;

a=x(1);
b=x(2);


tt=linspace(0.25,7.5,100);
plot(t,y,"r*");
hold on
plot(tt,a+b*log10(tt),"b-")
legend('Datos', 'a + b log_{10}(t)'), grid on
xlabel('Dosis (mg)'), ylabel('Aumento de peso (g)')