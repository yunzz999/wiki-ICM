close all;
clear all;
clc;

n = 200 ; %dimensión del espacio

q = rand(n);

Q = q'*q; % Matriz Q simétrica y definida positiva

b = rand(n,1);     % Vector b


f =@(x)  0.5 * x' * Q * x - b' * x ;

gradf =@(x)  Q * x - b ; 

hessf =@(x)  Q ;

x0 = rand(n,1);   % Punto inicial
tol = 1e-6;    % Tolerancia para la convergencia
max_iter = 1000; % Máximo número de iteraciones

%% Método del gradiente

tau = 1.99/norm(Q);   % Tamaño de paso

x_grad = x0;
tic
for k = 1:max_iter
    x_grad = x_grad - tau * gradf(x_grad);
    normgradf_grad(k) = norm(gradf(x_grad));
    if normgradf_grad(k) < tol
        break;
    end
end
toc

%% Método de Newton
x_new = x0;
tic
for k = 1:max_iter
    x_new = x_new - hessf(x_new) \ gradf(x_new);
    normgradf_new(k) = norm(gradf(x_new));
    if normgradf_new(k) < tol
        break;
    end
end
toc


figure(2)
axes('FontSize', 14);
hold on
plot(normgradf_grad,'o','LineWidth',2)
plot(normgradf_new,'o','LineWidth',2)
ylabel('$x_n$','FontSize', 18,'Interpreter','latex')
xlabel('Iteracion','FontSize', 18)
legend('Gradiente','Newton','FontSize',13,'Interpreter','latex')
set(get(gca,'ylabel'),'rotation',0)
title('Método del gradiente vs Método de Newton')
