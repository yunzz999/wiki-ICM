f=@(t,y) 100*(1-y);
options=odeset('RelTol','1e-6','AbsTol','1e-4');

[tt,yy]=ode45(f,[0 5],2);
[t,y]=ode15s(f,[0 5],2); %para stiff.

length(tt)
length(t)

plot(tt,yy,"r");
hold on
plot(t,y,"m--")
grid on