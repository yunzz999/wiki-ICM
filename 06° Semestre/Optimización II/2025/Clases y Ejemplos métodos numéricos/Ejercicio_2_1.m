close all;
clear all;
clc;


f =@(x)  5*(x.^4/2-7*x.^3/9+x.^2/3);

gradf =@(x) 10*x*(x-1/2)*(x-2/3) ;

%% Metodo del Gradiente

%x_{n+1} = x_n - alpha_n * nabla f (x_n)

% numero de iteraciones
max_iter = 100;

% valor inicial x_0

%x0 = 0.1;
%x0 = 0.4;
x0 = 0.8;
%x0 = 10;

%% alpha1
alpha1 = 1/3;
x_grad1 = x0;
for j = 1 : max_iter
    x_grad1(j+1) = x_grad1(j) - alpha1*gradf(x_grad1(j));
end

%% alpha2 Armijo
alpha2_0 = 1;
x_grad2 = x0;
tau = 8/9;
contadorBL = zeros(1,100);
omega = 0.1;

for j = 1 : max_iter
    alpha2 = alpha2_0;
    while f(x_grad2(j) - alpha2*gradf(x_grad2(j))) > f(x_grad2(j)) - omega * alpha2*(gradf(x_grad2(j)))^2
        contadorBL(j) = contadorBL(j) + 1;
        alpha2 = tau *alpha2;
    end
    x_grad2(j+1) = x_grad2(j) - alpha2*gradf(x_grad2(j));
end



%% alpha3 Armijo2
alpha3_0 = 1;
x_grad3 = x0;
tau = 1/500;
contadorBL3 = zeros(1,100);
omega = 0.9;

for j = 1 : max_iter
    alpha3 = alpha3_0;
    while f(x_grad3(j) - alpha3*gradf(x_grad3(j))) > f(x_grad3(j)) - omega * alpha3*(gradf(x_grad3(j)))^2
        contadorBL(j) = contadorBL(j) + 1;
        alpha3 = tau *alpha3;
    end
    x_grad3(j+1) = x_grad3(j) - alpha3*gradf(x_grad3(j));
end


% grafico
figure(1)
axes('FontSize', 14);
hold on
plot(x_grad1,'o','LineWidth',2)
plot(x_grad2,'o','LineWidth',2)
plot(x_grad3,'o','LineWidth',2)
ylabel('$x_n$','FontSize', 18,'Interpreter','latex')
xlabel('Iteracion','FontSize', 18)
legend('$\alpha_n=1/3$','Armijo $\tau=8/9$, $\omega = 0.1$','Armijo $\tau=1/100$, $\omega = 0.1$','FontSize',13,'Interpreter','latex')
set(get(gca,'ylabel'),'rotation',0)
title('Método del gradiente para diferentes pasos')

malla = [-1:0.01:1];
% grafico
figure(2)
axes('FontSize', 14);
hold on
plot(malla,f(malla),'-','LineWidth',2)
plot(x_grad1,f(x_grad1),'o','LineWidth',2)
plot(x_grad2,f(x_grad2),'o','LineWidth',2)
plot(x_grad3,f(x_grad3),'o','LineWidth',2)
ylabel('$f(x_n)$','FontSize', 18,'Interpreter','latex')
xlabel('Iteracion','FontSize', 18)
legend('$x^2$','$\alpha_n=1/3$','Armijo $\tau=8/9$, $\omega = 0.1$','Armijo $\tau=1/100$, $\omega = 0.1$','FontSize',13,'Interpreter','latex')
set(get(gca,'ylabel'),'rotation',0)
xlim([-0.2 1]);
ylim([-0.001 0.2]);

title('Método del gradiente para diferentes pasos')
