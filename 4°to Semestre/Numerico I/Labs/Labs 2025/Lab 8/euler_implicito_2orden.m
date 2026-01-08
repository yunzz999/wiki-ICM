function [x,z1,z2] = euler_implicito_2orden(a,b,f1,f2,y0,d0,N)

% Método de Euler Implícito para resolver el PVI
%   y''(x) = f(x,y(x),y'(x)) con x en [a,b],   
%   y(a) = y0, y'(a) = d0
% con N subintervalos de igual longitud h. 
% Al ingresar las variables auxiliares z1 = y, z2 = y', entonces 
% escribimos el problema como
%      z1' = f1(x,z1,z2)
%      z2' = f2(x,z1,z2)
% Las entradas f1, f2, deben ser ingresadas como function_handle.

% Calculamos h
h = (b-a)/N;

% Inicializamos las variables de salida
z1 = zeros(N+1,1);
z2 = zeros(N+1,1);
z1(1) = y0; % condición inicial
z2(1) = d0; % condición inicial

% Particion del intervalo
x = (a:h:b)';

% Método de Euler Implícito
% Se resuelve el sistema de ecuaciones no lineales
for i = 1:N
    g = @(alfa) alfa - [z1(i);z2(i)] - h*[f1(x(i+1),alfa(1),alfa(2));f2(x(i+1),alfa(1),alfa(2))];%f(x(i+1),alfa);
    alfa0 = [z1(i);z2(i)];
    alfa = fsolve(g,alfa0);
    z1(i+1) = alfa(1);
    z2(i+1) = alfa(2);
end

end