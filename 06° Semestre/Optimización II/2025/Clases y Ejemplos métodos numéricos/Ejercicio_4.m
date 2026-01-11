close all;
clear all;
clc;



f =@(x)  x.*atan(x)-log(1+x.^2)/2 ;

gradf =@(x)  atan(x) ; %arctan es 1-Lipschitz

hessf =@(x)  1/(1+x^2) ;


%x0 = 0.1;   % Punto inicial
x0 = 1.5;   % Punto inicial

tol = 1e-12;    % Tolerancia para la convergencia
max_iter = 10; % Máximo número de iteraciones

%% Método del gradiente

tau = 0.99;   % Tamaño de paso

x_grad(1) = x0;
for k = 1:max_iter
    x_grad(k+1) = x_grad(k) - tau * gradf(x_grad(k));
    if norm(gradf(x_grad(k+1))) < tol
        break;
    end
end

%% Método de Newton
x_new(1) = x0;
for k = 1:max_iter
    x_new(k+1) = x_new(k) - hessf(x_new(k)) \ gradf(x_new(k));
    if norm(gradf(x_new(k+1))) < tol
        break;
    end
end

%while norm(gradf(x_new(k+1))) > tol
 %   k=k+1;
 %     x_new(k+1) = x_new(k) - hessf(x_new(k)) \ gradf(x_new(k));
%end




figure(2)
axes('FontSize', 14);
hold on
plot(x_grad,'o','LineWidth',2)
plot(x_new,'o','LineWidth',2)
ylabel('$x_n$','FontSize', 18,'Interpreter','latex')
xlabel('Iteracion','FontSize', 18)
legend('Gradiente','Newton','FontSize',13,'Interpreter','latex')
set(get(gca,'ylabel'),'rotation',0)
title('Método del gradiente vs Método de Newton')

malla = [-6:0.1:6];

% grafico
figure(1)
axes('FontSize', 14);
hold on
plot(malla,f(malla),'-','LineWidth',2)
plot(x_grad,f(x_grad),'o','LineWidth',2)
plot(x_new,f(x_new),'o','LineWidth',2)
ylabel('$f(x_n)$','FontSize', 18,'Interpreter','latex')
xlabel('Iteracion','FontSize', 18)
legend('$x\arctan(x)-\frac{1}{2}\log(1+x^2)$','Gradiente','Newton','FontSize',13,'Interpreter','latex')
set(get(gca,'ylabel'),'rotation',0)
title('Método del gradiente Vs Newton')
