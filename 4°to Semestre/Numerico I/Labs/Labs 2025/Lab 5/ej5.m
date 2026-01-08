t=[0.5,1,2,3,4]'; 
y=[7,5.2,3.8,3.2,2.5]'; %5x1
A=[exp(-1.5*t),exp(-0.3*t),exp(-0.05*t)]; %5x3


x=A'*A\A'*y; %
c_1=x(1);
c_2=x(2);
c_3=x(3);



tt=linspace(0.5,4,100);
plot(t,y,"r*")
hold on
plot(tt,c_1*exp(-1.5*tt)+c_2*exp(-0.3*tt)+c_3*exp(-0.05*tt),"r")
legend("datos","p(t)")