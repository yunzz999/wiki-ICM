t=(1:0.5:5)';
y=[-0.25,-0.2,-0.07,-0.09,-0.01,-0.01,-0.08,-0.01,-0.01]'; %n x 1
A=[exp(t),exp(-t)]; % n x 2 
b=y;
x=A\y;  %nx1
c1=x(1);
c2=x(2);
r=norm(A*x-y);
f=@(x) c1.*exp(x)+c2.*exp(-x);
y_pred=f(4.25);

plot(t,y,"r*")
hold on
plot(t,f(t),"b")