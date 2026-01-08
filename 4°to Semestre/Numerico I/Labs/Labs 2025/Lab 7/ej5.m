y0=1;
f=@(t,y) -200*y+200*sin(t)+cos(t);
N=160;
[ex_x,ex_y]=euler_explicito(0,1,f,y0,N);
[im_x,im_y]=euler_implicito(0,1,f,y0,N);

plot(ex_x,ex_y,"r--")
hold on
plot(im_x,im_y,"b--");
grid on
legend("Explicito","Implicito")

%2. Son similares hasta un punto y luego el explicito se dispara
%3. NO
%4. ahora son similares.