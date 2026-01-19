close all;
clear all;
clc;


f =@(x)  x.^2;

gradf =@(x)  2*x ;

%% Metodo del Gradiente

%x_{n+1} = x_n - tau * nabla f (x_n)

% numero de iteraciones
max_iter = 100;

% valor inicial x_0

x0 = 5;

% Tau = 1/3
t2 = 1/3;
x_grad2 = x0;
for j = 1 : max_iter
    x_grad2(j+1) = x_grad2(j) - t2*gradf(x_grad2(j));
end



%% Método de newton
%x_{n+1} = x_n - [nabla^2 f(x_n)]^(-1) nabla f (x_n)

hessf =@(x)  2 ;

x_new(1)=x0;

for j = 1 : max_iter
    x_new(j+1) = x_new(j) - (hessf(x_new(j)))^(-1).*gradf(x_new(j));
end

figure(2)
axes('FontSize', 14);
hold on
plot(x_grad2,'o','LineWidth',2)
plot(x_new,'o','LineWidth',2)
ylabel('$x_n$','FontSize', 18,'Interpreter','latex')
xlabel('Iteracion','FontSize', 18)
legend('Gradiente','Newton','FontSize',13,'Interpreter','latex')
set(get(gca,'ylabel'),'rotation',0)
title('My Title')
title('Método del gradiente vs Método de Newton')


malla = [-6:0.1:6];

% grafico
figure(1)
axes('FontSize', 14);
hold on
plot(malla,f(malla),'-','LineWidth',2)
plot(x_grad2,f(x_grad2),'o','LineWidth',2)
plot(x_new,f(x_new),'o','LineWidth',2)
ylabel('$f(x_n)$','FontSize', 18,'Interpreter','latex')
xlabel('Iteracion','FontSize', 18)
legend('$x^2$','Gradiente','Newton','FontSize',13,'Interpreter','latex')
set(get(gca,'ylabel'),'rotation',0)
title('Método del gradiente Vs Newton')
