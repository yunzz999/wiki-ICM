x = [0; 1; 3];
y = [0; 1; 4];

%Armamos el sistema
A = [ones(3,1) x x.^2]
b = y
%a = inv(A)*b
a = A\b

%graficando
x_grafica = linspace(-1,5,200);
a0 = a(1);
a1 = a(2);
a2 = a(3);
p = @(x) a0+a1.*x + a2.*x.^2;

plot(x,y,'or',x_grafica,p(x_grafica),'b')

% x1=x(1); x2=x(2); x3=x(3);
% y1=y(1); y2=y(2); y3=y(3);
% pl=@(x) y1*(x-x2).*(x-x3)/((x1-x2)*(x1-x3))...
%     + y2*(x-x1).*(x-x3)/((x2-x1)*(x2-x3))...
%     + y3*(x-x1).*(x-x2)/((x3-x1)*(x3-x2));
% xg=linspace(-1,5,20);
% plot(x,y,'or',x_grafica,p(x_grafica),'b',xg,p(xg),'k+')




