t=(0:1:10)';
y=[5.03,4.71,4.4,3.97,3.88,3.62,3.3,3.15,3.08,2.92,2.7]';
Y=1./y;

A=t.^(0:1);
x=A'*A\A'*Y;

n_0=1./x(1);
alpha=x(2);

tt=linspace(0,10,110);
plot(t,y,"r*")
hold on
plot(tt,n_0./(1+n_0*alpha*tt),"b");
xlabel("Tiempo(seg)"),ylabel("n(x10^{-4})") ,grid on
legend("datos","n(t)")
