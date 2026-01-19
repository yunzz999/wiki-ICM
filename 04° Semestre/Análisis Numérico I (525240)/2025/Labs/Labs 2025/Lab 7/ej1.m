x=@(t) 1./(1+t.^3);
f = @(t,y) -3*t.*y.^2 + 1./(1+t.^3);   % f(t,y)
[x_num,y_num]= euler_explicito(0, 5, f, 0,1000);  % [t ; y]
[t_num,tt_num]=euler_implicito(0,5,f,0,1000);

plot(x_num,x(x_num),"r");
hold on
plot(x_num,y_num,"b");
hold on
plot(t_num,tt_num,"y")
grid on
legend("Solucion Exacta","Solucion Numerica EX","Solucion Numerica IM")