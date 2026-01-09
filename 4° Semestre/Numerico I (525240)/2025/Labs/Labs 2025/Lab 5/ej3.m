t=[1, 1.5 ,2 ,2.5, 3 , 3.5 , 4 , 4.5 ,5]';
y=[-0.25,-0.2,-0.07,-0.09,-0.01,-0.01,-0.08,-0.01,-0.01]';


A=[exp(t),exp(-t)];
x=A'*A\A'*y;
c_1=x(1)
c_2=x(2)
r=norm(y-A*x)
y_pred=c_1*exp(4.25)+c_2*exp(-4.25)
tt=linspace(1,5,100);
plot(t,y,"r*")
hold on
plot(tt,c_1*exp(tt)+c_2*exp(-tt),"b")
legend("datos","f(t)")