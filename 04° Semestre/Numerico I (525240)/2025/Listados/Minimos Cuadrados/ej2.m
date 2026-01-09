f=@(x) cos((2*pi./24)*x);
g=@(x) sin((2*pi./24)*x);

x=[0,6,12,18,24,30,36,42,48]'
y=[2,5,13,10,3,6,14,9,3]'


A=[x.^0,f(x),g(x)]

sol=A\y;

h=@(x) sol(1)+sol(2)*f(x)+sol(3)*g(x);
tt=linspace(0,48,100);
plot(x,y,"ro")
hold on
grid on
plot(tt,h(tt),"b");