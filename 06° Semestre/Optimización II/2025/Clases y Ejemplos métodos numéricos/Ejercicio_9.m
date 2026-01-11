close all;
clear all;
clc;


%% Función objetivo y gradiente
f  = @(x) x(1)^2+x(2)^2+x(3)^2+x(4)^2;
gradf = @(x)  2*x;  % gradiente respecto a (x,y)

%% Restricciones: h_i(x,y) =
h  = @(x) x(1)+x(2)+x(3)+x(4)- 1;   % 
gradh = @(x) [1 ; 1 ; 1 ; 1];    % gradiente de h_i

%% Restricciones: g_i(x,y) =
alpha =  1/4;
g  = @(x) x(4) - alpha;   % 
gradg = @(x) [0 ; 0 ; 0 ; 1];    % gradiente de g_i


%% Parámetros generales
max_iter = 20;
max_iter_grad = 200;

x0 = rand(4,1);

%% ==========================================================
% MÉTODO DE PENALIZACIÓN 
% ==========================================================
mu = 10;     % parámetro inicial de penalización
x = x0; 

psi = @(t) t.^2 ;
dpsi = @(t) 2.*t ;

phi = @(t) (max(0,t)).^2 ;
dphi = @(t) 2*(max(0,t)) ;


F = @(x,mu) f(x) + mu*(psi(h(x)) + phi(g(x)) );

dF = @(x,mu) (2*x + mu*(dpsi(h(x))*gradh(x)  + dphi(g(x))*gradg(x) ));

omega = 0.9;
tau = 1/2 ;

for k = 1:max_iter  % número de niveles de penalización
    for iter = 1:max_iter_grad
         gamma = mu;
        while F(x  - gamma*dF(x,mu),mu) > F(x,mu) - omega * gamma*sum(dF(x,mu).^2)
            gamma = tau *gamma;
        end
        x = x  - gamma*dF(x,mu);
    end
    mu = mu * 5; % aumenta penalización
end

x_pen = x;

%F(x_pen,mu)

f(x_pen)


(1-2*alpha+4*alpha^2)/3