% Variables a evaluar
% x432
% length
% t_impacto
% h_previo
% v_impacto

% Escriba su solución aquí


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% FUNCIONES A UTILIZAR %%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% EULER EXPLÍCITO %%%%%%%%%%%%%%%%%%%%%%
function [x,z1,z2] = euler_explicito_2orden(a,b,f1,f2,y0,d0,N)

% Método de Euler Explícito para resolver el PVI
%   y''(x) = f(x,y(x),y'(x)) con x en [a,b],   
%   y(a) = y0, y'(a) = d0
% con N subintervalos de igual longitud h. 
% Al ingresar las variables auxiliares z1 = y, z2 = y', entonces 
% escribimos el problema como
%      z1' = f1(x,z1,z2)
%      z2' = f2(x,z1,z2)
% Las entradas f1 y f2 deben ser entregadas como function handle.

% Calculamos h
h = (b-a)/N;

% Inicializamos las variables de salida
z1 = zeros(N+1,1);
z2 = zeros(N+1,1);
z1(1) = y0; % condición inicial
z2(1) = d0; % condición inicial

% Particion del intervalo
x = (a:h:b)';

% Método de Euler
for i = 1:N
    z1(i+1) = z1(i) + h*f1(x(i),z1(i),z2(i));
    z2(i+1) = z2(i) + h*f2(x(i),z1(i),z2(i));
end

end

g=9.8;
m=200;
C_d=1.5;
A=3;
p=@(h) 1.225.*exp(-h/7500);
z1p = @(t,z1,z2)  -g - 1./(2.*m)*p(z2).*C_d.*A.*z1.*abs(z1);
z2p = @(t,z1,z2)  z1;
I=linspace(0,500,5001);
x432=I(433);
length=I(2)-I(1);

[Ie,z1se,z2se]=euler_explicito_2orden(0,500,z1p,z2p,0,20000,5000);

for i=1:5000
    if z2se(i) <= 0
        h_impacto=z2se(i);
        t_impacto=Ie(i);
        t_previo=Ie(i-1);
        h_previo=z2se(i-1);
        v_impacto=-z1se(i); % pues v=-h'(t)
        break;
    end
end

plot(Ie,z2se,"b")
hold on
plot(Ie,z1se,"r")
hold on
plot(t_impacto,h_impacto,"ko")
hold on
plot(t_previo,h_previo,"mo")
grid on
legend("h(t)","h'(t)")




