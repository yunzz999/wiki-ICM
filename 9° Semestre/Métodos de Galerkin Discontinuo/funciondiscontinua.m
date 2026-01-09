clear all; close all; clc;
% Parámetros del problema
gamma = 100;  % Constante de penalización
N = 100;  % Número de elementos
h = 1/N;  % Tamaño de elemento
x = linspace(0, 1, N+1);  % Coordenadas de los nodos

% Definición de las funciones base
phi_left = @(xi) (1-xi)/h;
phi_right = @(xi) xi/h;

% Definición de la matriz de rigidez
K = zeros(N+1, N+1);  % Matriz de rigidez
f = zeros(N+1, 1);  % Vector de carga

for i = 1:N
    % Coordenadas locales
    xi_left = -1;
    xi_right = 1;
    
    % Coordenadas globales
    x_left = x(i);
    x_right = x(i+1);
    
    % Cálculo de la matriz elemental y el vector elemental
    Ke = gamma/h * [1 -1; -1 1] + h/2 * [1 0; 0 1];
    fe = h/2 * [cos(pi*x_left); cos(pi*x_right)];
    
    % Ensamblaje de la matriz elemental y el vector elemental
    K(i:i+1, i:i+1) = K(i:i+1, i:i+1) + Ke;
    f(i:i+1) = f(i:i+1) + fe;
end

% Aplicación de las condiciones de contorno
K(1, :) = 0;
K(1, 1) = 1;
f(1) = 0;

K(N+1, :) = 0;
K(N+1, N+1) = 1;
f(N+1) = 0;

% Resolución del sistema lineal
u = K\f;

% Gráfico de la solución
figure;
plot(x, u);
xlabel('x');
ylabel('u(x)');
title('Solución de la ecuación de Laplace');