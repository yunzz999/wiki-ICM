clear all; clc;
R = 0.5; L = 50; a = 0.02; 
ki = 3*10^(-3);l1 =0.5; l0 = 0.3;
M = 0.25; k = 24.5; d = 1.5;
%% Punto de operación
u0 = 0.3;
x3 = 0;
x1 = u0/R;
F3 =@(x,y,z,u) ki*x^2/(M*(l1-y+a))-(k/M)*(y-l0)-(d/M)*z;
x2 = fzero(@(t) F3(x1,t,x3,u0),l0);
% x2 = 1;
% x3 = 0; % es directo notar que x03 = 0
% F1 =@(x,y,z,u) -(R/L)*x + (1/L)*u;
% F2 =@(x,y,z,u) z;
% F3 =@(x,y,z,u) ki*x^2/(M*(l1-y+a))-(k/M)*(y-l0)-(d/M)*z;
% F =@(x,y,z,u) [F1(x,y,z,u);F2(x,y,z,u);F3(x,y,z,u)];
% f3 =@(t) F3(t,x2,x3,4);
% x1 = sqrt(abs(k*(x2-l0)*(l1 - x2 + a)/ki)); % x01
% u0 = x1*R;
% y0 = x2; % variable de salida
x0 = [x1;x2;x3;u0]; % punto de operación
%f0 = norm(F(x1,x2,x3,u0));% comprobación
%% Matrices
A = [-R/L, 0, 0;
      0,  0,  1;
      2*ki.*x0(1)/(M*(l1-x0(2)+a)), (ki.*x0(1).^2)/(M*(l1-x0(2)+a)^2)-k/M, -d/M];
B = [1/L;
     0;
     0];
C = eye(3,3);
D = 0;
%% Solución sistema no lineal
t = linspace(0, 20, 1000); % Vector de tiempo
%u =@(t) 2.*(t>=0) + 10.*(t.*(t>=10));
u =@(t) u0+l0.*(t>=0);
%u =@(t) u0*(1+2*(t>=5) - 2*(t>=10));
%u =@(t) 5.*(t>=0) + 10.*(t.*(t>=10));
[tn,xn] = ode45(@(t,x)SEDON(t,x,u),[0 20],[x0(1) x0(2) x0(3)]);
%% Solución sitema lineal
masa = ss(A,B,C,D);
[y,~,x] = lsim(masa,u(t)-x0(4),t,[0 0 0]);
%% Comparación EDO lineal con EDO no lineal
% figure;
% subplot(4,1,1);
% plot(t,u(t)),legend('u(t)')
% grid on
% title('Respuesta del sistema lineal vs no lineal con u = u0(1+2u(t-5) - 2u(t-10))');
% subplot(4,1,2);
% plot(t,x(:,1)+x0(1),tn,xn(:,1)), legend('i(t)','in(t)')
% grid on
% subplot(4,1,3);
% plot(t,x(:,2)+x0(2),tn,xn(:,2)), legend('x(t)','xn(t)')
% grid on
% subplot(4,1,4);
% plot(t,x(:,3)+x0(3),tn,xn(:,3)), legend('v(t)','vn(t)')
% grid on
figure;
subplot(4,1,1);
plot(t,u(t)),legend('u(t)')
grid on
title('Respuesta del sistema lineal vs no lineal con u = u0+l0');
subplot(4,1,2);
plot(t,x(:,1)+x0(1),tn,xn(:,1)), legend('i(t)','in(t)')
grid on
subplot(4,1,3);
plot(t,x(:,2)+x0(2),tn,xn(:,2)), legend('x(t)','xn(t)')
grid on
subplot(4,1,4);
plot(t,x(:,3)+x0(3),tn,xn(:,3)), legend('v(t)','vn(t)')
grid on






