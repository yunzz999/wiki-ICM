close all;
clear all;
clc;


f =@(x)  x.^2;

gradf =@(x)  2*x ;

%% Metodo del Gradiente

%x_{n+1} = x_n - alpha_n * nabla f (x_n)

% numero de iteraciones
max_iter = 100;

% valor inicial x_0
x0 = 5;

% alpha_n = 1
alpha1 = 1;
x_grad1 = x0;
for j = 1 : max_iter
    x_grad1(j+1) = x_grad1(j) - alpha1*gradf(x_grad1(j));
end

% alpha = 1/3
alpha2 = 1/3;
x_grad2 = x0;
for j = 1 : max_iter
    x_grad2(j+1) = x_grad2(j) - alpha2*gradf(x_grad2(j));
end


% grafico
figure(1)
axes('FontSize', 14);
hold on
plot(x_grad1,'o','LineWidth',2)
plot(x_grad2,'o','LineWidth',2)
ylabel('$x_n$','FontSize', 18,'Interpreter','latex')
xlabel('Iteracion','FontSize', 18)
legend('$\alpha_n=1$','$\alpha_n=1/3$','FontSize',13,'Interpreter','latex')
set(get(gca,'ylabel'),'rotation',0)
title('Método del gradiente para diferentes pasos')

malla = [-6:0.1:6];
% grafico
figure(2)
axes('FontSize', 14);
hold on
plot(malla,f(malla),'-','LineWidth',2)
plot(x_grad2,f(x_grad2),'o','LineWidth',2)
plot(x_grad1,f(x_grad1),'o','LineWidth',2)
ylabel('$f(x_n)$','FontSize', 18,'Interpreter','latex')
xlabel('Iteracion','FontSize', 18)
legend('$x^2$','$\alpha_n=1/3$','$\alpha_n=1$','FontSize',13,'Interpreter','latex')
set(get(gca,'ylabel'),'rotation',0)
title('Método del gradiente para diferentes pasos')

