clear; clc;
R = 0.5; L = 0.05; a = 0.02; 
ki = 3*10^(-3);l1 =0.5; l0 = 0.3;
M = 0.25; k = 24.5; d = 1.5;
%% Puntos de operación
u0 = 0.1;
x2 = 0;
%% Problema 1a
F3 =@(t) ki*u0^2/(M*R*R*(l1-t+a))-(k/M)*(t-l0);
x1 = fzero(F3,0);
x0 = [x1; x2; u0]; % Punto de operación
Xi =@(x,y) ki*x^2/(M*R*R*(l1-y+a)^2) - k/M;
Xihat =@(x,y) 2*ki*x/(M*R*R*(l1-y+a));
xi = Xi(u0,x1);
xihat = Xihat(u0,x1);
eta = d/M;
beta = xihat;
alpha = sqrt(-(eta/2)^2 - xi);
delta = eta^2 - 4*xi;
%% Transformadas
syms t w 
e = -3*heaviside(t-2/18) + 3*heaviside(t-7/18) + 3*heaviside(t-11/18) - 3*heaviside(t-16/18);
h = (beta/alpha)*exp(-eta*abs(t)/2)*sin(alpha*abs(t));
h_w = fourier(h,t,w);
h_s = laplace(h);
e_s = laplace(e);
e_w = fourier(e,t,w);
y_s = h_s*e_s;
y_w = h_w*e_w;
Y_w = inline(y_w);
E_w = inline(e_w);
H_w = inline(h_w);
y = ilaplace(y_s);
Y = inline(y);
x = linspace(-30*pi,30*pi,1000);
figure;
subplot(3,1,1);
plot(x,abs(Y_w(x))), legend('y(w)')
grid on
title('Transformadas de Fourier')
subplot(3,1,2);
plot(x,abs(E_w(x))), legend('e(w)')
grid on
subplot(3,1,3);
plot(x,abs(H_w(x))), legend('h(w)')
grid on