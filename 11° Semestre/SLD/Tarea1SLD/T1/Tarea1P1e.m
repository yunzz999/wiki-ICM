clear all; clc;
R = 0.5; L = 50; a = 0.02; 
ki = 3*10^(-3);l1 =0.5; l0 = 0.3;
M = 0.25; k = 24.5; d = 1.5;
%% Puntos de operación
u0 = 3;
x1 = u0/R;
x3 = 0;
F3 =@(t) ki*x1^2/(M*(l1-t+a))-(k/M)*(t-l0)-(d/M)*x3;
x2 = fzero(F3,l0);
x0 = [x1; x2; x3; u0]; % Punto de operación
%% Matrices
A = [ 0,  1;
     (ki.*x0(1).^2)/(M*(l1-x0(2)+a)^2)-k/M, -d/M];
B = [0;
     0];
C = eye(2,2);
D = 0;
%% Solución sistema lineal
t = linspace(0, 20, 1000); % Vector de tiempo
u =@(t) u0+l0.*(t>=0);
masa = ss(A,B,C,D);
[y,~,x] = lsim(masa,u(t)-x0(4),t,[0 0]);
%% Solución sistema no lineal
u =@(t) u0+l0.*(t>=0);
[tn,xn] = ode45(@(t,x)SEDON2(t,x,u),[0 20],[x0(2) x0(3)]);
figure;
subplot(4,1,1);
plot(t,u(t)),legend('u(t)')
grid on
title('Respuesta del sistema lineal vs no lineal con u = u0+l0');
subplot(4,1,2);
plot(t,x0(1).*ones(length(t))), legend('i(t)')
grid on
subplot(4,1,3);
plot(t,x(:,1)+x0(2),tn,xn(:,1)), legend('x(t)','xn(t)')
grid on
subplot(4,1,4);
plot(t,x(:,2)+x0(3),tn,xn(:,2)), legend('v(t)','vn(t)')
grid on