t=(1:0.5:5)';
y=[-0.25,-0.2,-0.07,-0.09,-0.01,-0.01,-0.08,-0.01,-0.01]';
Y=log(1-(1./y));
A=t.^(0:1);

x=A'*A\A'*Y;
alpha=exp(x(1));
beta=x(2);
r=norm(A*x-Y);
y_pred=1./1-(alpha*exp(beta*4.25))

tt=linspace(1,5,100);
plot(tt,log(alpha)+beta*tt,"r")
hold on
plot(t,Y,"r*")
hold on
plot(t,y,"b*")
hold on
plot(tt,1./1-(alpha*exp(beta*tt)),"b")
