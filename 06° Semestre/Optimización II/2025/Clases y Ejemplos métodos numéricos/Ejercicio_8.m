close all;
clear all;
%clc;


%% Función objetivo y gradiente
f  = @(x) x(1)^2+x(2)^2;
gradf = @(x)  2*[x(1) ; x(2)];  % gradiente respecto a (x,y)

%% Restricciones: h_i(x,y) =
h  = @(x) -x(1)-x(2)+ 4;   % 
gradh = @(x) [-1 ; -1];    % gradiente de h_i

%% Restricciones: g_i(x,y) =
g  = @(x) -2*x(1) - x(2) + 5;   % 
gradg = @(x) [-2 ; -1];    % gradiente de g_i


sol = [2 ; 2];

%% Parámetros generales
max_iter = 500;
max_iter_grad = 100;

x0 = [4 ; 4];

%% ==========================================================
% MÉTODO DE BARRERA
% ==========================================================
mu = 2;     % parámetro inicial de BARRERA
x = x0; 

psi = @(x) sum(log(-x)) ;
dpsi = @(x) -1./x ;


F = @(x,mu) f(x) - mu*(psi(h(x)) + psi(g(x)));

dF = @(x,mu) ( gradf(x) - mu*( dpsi(h(x))*gradh(x)  + dpsi( g(x) )*gradg(x) ) );

omega = 0.9;
tau = 1/2 ;
c1 = 1e-4;
c2 = 0.9;
for k = 1:max_iter  % número de niveles de penalización
    for iter = 1:max_iter_grad
         gamma = 0.01;
         d = dF(x,mu);
         d2 = sum(dF(x,mu).^2);
        while (F(x - gamma*d,mu) > F(x,mu) - omega*gamma*d2) || (g(x - gamma*d) >= 0) || (h(x - gamma*d) >= 0)  %regla de Armijo
            gamma = tau *gamma;
        end
        x = x  - gamma*dF(x,mu);
    end
    mu = mu / 2; % aumenta penalización
end

x_pen = x;

% x
% 
% f(sol)
% 
% F(x_pen,mu)
% 
% f(x_pen)

