close all;
clear all;
clc;

%% PROBLEMA CUADRÁTICO ALEATORIO
n = 500; % dimensión
A = randn(n,n);
Q = A'*A + eye(n); % simétrica definida positiva
b = randn(n,1);

f = @(x) 0.5*x'*Q*x - b'*x;
gradf = @(x) Q*x - b;
Hessf = @(x) Q;

x_opt = Q\b; % solución exacta

%% PARÁMETROS GENERALES
max_iter = 5000;
tol = 1e-6;
x0 = zeros(n,1);


%% 1. MÉTODO DEL GRADIENTE CON PASO FIJO
alpha = 0.99*2/norm(Q);
x_grad = x0;
tic
for k = 1:max_iter
    g = gradf(x_grad(:,k));
    if norm(g) < tol, break; end
    x_grad(:,k+1) = x_grad(:,k) - alpha*g;
end
time_grad = toc;
iter_grad = k;


%% 2. MÉTODO DE NEWTON
x_newton = x0;
tic
for k = 1:max_iter
    g = gradf(x_newton(:,k));
    if norm(g) < tol, break; end
    H = Hessf(x_newton(:,k));
    p = - H \ g;
    x_newton(:,k+1) = x_newton(:,k) + p;
end
time_newton = toc;
iter_newton = k;

%% 3. MÉTODO QUASI-NEWTON (BFGS)
x_bfgs = x0;
B = eye(n);
tau = 0.9;
omega = 0.5;
c1 = 1e-4;
c2 = 0.9;
tic 
for k = 1:max_iter
    g = gradf(x_bfgs(:,k));
    if norm(g) < tol, break; end
    p = - B * g;
    alpha = wolfe(f, gradf, x_bfgs(:,k), p, c1, c2,0.1,1);
    x_bfgs(:,k+1) = x_bfgs(:,k) + alpha*p;
    gamma_n = gradf(x_bfgs(:,k+1)) - g;
    delta_n = x_bfgs(:,k+1) - x_bfgs(:,k);
    if gamma_n'*delta_n > 1e-30
        B = B + (1+gamma_n'*B*gamma_n/(gamma_n'*delta_n))*(delta_n*delta_n')/(gamma_n'*delta_n) - (B*gamma_n*delta_n'+delta_n*gamma_n'*B)/(gamma_n'*delta_n);
    end
end
time_bfgs = toc;
iter_bfgs = k;

%% 4. GRADIENTE CONJUGADO (FLETCHER–REEVES)
x_cg = x0;
g = gradf(x_cg(:,1));
d = -g;
tic;
alpha = 0.99*2/norm(Q);
for k = 1:max_iter
    if norm(g) < tol, break; end
    alpha = (g'*g) / (d'*Q*d); % alpha de busqueda linal exacta.
    x_cg(:,k+1) = x_cg(:,k) + alpha*d;
    g_new = gradf(x_cg(:,k+1));
    beta = (g_new'*g_new) / (g'*g);
    d = -g_new + beta*d;
    g = g_new;
end
time_cg = toc;
iter_cg = k;

%% RESULTADOS
fprintf('Iteraciones:\n');
fprintf(' Gradiente fijo: %d\n', iter_grad);
fprintf(' Newton: %d\n', iter_newton);
fprintf(' BFGS (Wolfe): %d\n', iter_bfgs);
fprintf(' Gradiente conjugado: %d\n', iter_cg);

fprintf('\nTiempo:\n');
fprintf(' Gradiente fijo: %d\n', time_grad);
fprintf(' Newton: %d\n', time_newton);
fprintf(' BFGS (Wolfe): %d\n', time_bfgs);
fprintf(' Gradiente conjugado: %d\n', time_cg);

fprintf('\nError final ||x - x*||:\n');
fprintf(' Gradiente fijo: %.2e\n', norm(x_grad(:,end)-x_opt));
fprintf(' Newton: %.2e\n', norm(x_newton(:,end)-x_opt));
fprintf(' BFGS (Wolfe): %.2e\n', norm(x_bfgs(:,end)-x_opt));
fprintf(' Gradiente conjugado: %d\n', norm(x_cg(:,end)-x_opt));

fprintf('\nf(x):\n');
fprintf(' Gradiente fijo: %.2e\n', f(x_grad(:,end)));
fprintf(' Newton: %.2e\n', f(x_newton(:,end)));
fprintf(' BFGS (Wolfe): %.2e\n', f(x_bfgs(:,end)));
fprintf(' Gradiente conjugado: %.2e\n', f(x_cg(:,end)));



%% GRAFICAR NORMA DEL GRADIENTE
figure (2);
semilogy(0:iter_grad-1, vecnorm(Q*x_grad(:,1:iter_grad)-b), '-','LineWidth',1.5); hold on;
semilogy(0:iter_newton-1, vecnorm(Q*x_newton(:,1:iter_newton)-b), '-','LineWidth',1.5);
semilogy(0:iter_bfgs-1, vecnorm(Q*x_bfgs(:,1:iter_bfgs)-b), '-','LineWidth',1.5);
semilogy(0:iter_cg-1, vecnorm(Q*x_cg(:,1:iter_cg)-b), '-','LineWidth',1.5);
xlabel('Iteración','FontSize',14)
ylabel('$\|\nabla f(x_k)\|$','Interpreter','latex','FontSize',16)
legend('Gradiente fijo','Newton','BFGS (Wolfe)','Conjugado (FR)','Location','northeast')
grid on
title('Comparación de métodos con regla de Wolfe')



