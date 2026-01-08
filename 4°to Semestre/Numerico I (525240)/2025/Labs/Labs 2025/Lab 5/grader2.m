% Variables a evaluar:
%   Vector columna t e y.
%   Matriz A, vector columna b y solución x del sistema Ax=b.
%   Parámetros alpha y beta del modelo.
%   Norma del residuo r.
%   Predicción y_pred en t=4.25.
t=(1:0.5:5)';
y=[-0.25,-0.2,-0.07,-0.09,-0.01,-0.01,-0.08,-0.01,-0.01]';
b=log(1-1./y);
A=t.^(0:1);
x=A\b;
r=norm(A*x-b);

alpha=exp(x(1));
beta=x(2);
f=@(x) log(alpha)+beta.*x;
g=@(x) 1./ (1-alpha.*exp(beta.*x));
y_pred=g(4.25);


plot(t,y,"r*")
hold on
plot(t,b,"bd")
hold on
plot(t,f(t),"y")
hold on
plot(t,g(t),"m")