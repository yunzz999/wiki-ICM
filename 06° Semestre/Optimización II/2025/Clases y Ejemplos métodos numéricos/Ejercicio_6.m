close all;
clear all;
clc;


%rng(1)

a = 2;
b = 5;

% Función de Rosenbrock
f = @(x) (a - x(1))^2 + b*(x(2) - x(1)^2)^2;

% Gradiente de la función de Rosenbrock
grad_f = @(x) [-2*(a - x(1)) - 4*b*x(1)*(x(2) - x(1)^2);
               2*b*(x(2) - x(1)^2)];

% Hessiano de la función de Rosenbrock
Hess_f = @(x) [2 - 4*b*(x(2) - 3*x(1)^2), -4*b*x(1);
               -4*b*x(1), 2*b];

x0 = randn(2,1); % Punto inicial
alpha = 1e-3;  % Tamaño de paso
tol = 1e-6;     % Tolerancia para la convergencia
max_iter = 100000; % Máximo número de iteraciones

x_grad = x0;
for k = 1:max_iter
    x_grad = x_grad - alpha * grad_f(x_grad);
    if norm(grad_f(x_grad)) < tol
        break;
    end
end

fprintf('Método del Gradiente:\n');
fprintf('Solución: [%f,  %f]\n', x_grad(1), x_grad(2));
fprintf('Iteraciones: %d\n\n', k);

x_newton = x0;
for k = 1:max_iter
    grad = grad_f(x_newton);
    hess = Hess_f(x_newton);
    
    %Comprobar si el Hessiano es definido positivo
    if min(eig(hess)) > 0
        x_newton = x_newton - hess \ grad;
    else
        warning('El Hessiano no es definido positivo en la iteración %d', k);
        break;
    end
    if norm(grad) < tol
        break;
    end
end

fprintf('Método de Newton:\n');
fprintf('Solución: [%f, %f]\n', x_newton(1), x_newton(2));
fprintf('Iteraciones: %d\n', k);
