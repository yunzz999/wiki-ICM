function [x,y] = euler_implicito(a,b,f,y0,N)

% Método de Euler Implícito para resolver el PVI
%              y'(x) = f(x,y(x)) con x en [a,b],   
%               y(a) = y0
% con N subintervalos de igual longitud h. La entrada f debe ser entregada 
% como function handle

% Cálculo de h
h = (b-a)/N;

% Inicializamos la variable de salida
y = zeros(N+1,1);
y(1) = y0; % condición inicial

% Particion del intervalo
x = (a:h:b)';

% Método de Euler implícito
% Se resuelve la ecuación no lineal
% y(i+1) = y(i) + h*f(x(i+1),y(i+1))
for i = 1:N
    y(i+1) = fzero(@(t) t-y(i)-h*f(x(i+1),t),y(i));
end

end