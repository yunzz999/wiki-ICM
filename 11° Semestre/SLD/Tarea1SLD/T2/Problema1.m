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
h =@(t) (beta/alpha)*exp(-eta.*t./2).*sin(alpha.*t);
t = linspace(0,1);
plot(t,h(t)),legend('h(t)');
grid on
title('Expresión exacta de h(t)')
%% Problema 1b
syms t
f1 = 2/3*(t+3)*heaviside(t+3) - 4/3*t*heaviside(t) + 2/3*(t-3)*heaviside(t-3);
e = -3*heaviside(t-2/18) + 3*heaviside(t-7/18) + 3*heaviside(t-11/18) - 3*heaviside(t-16/18);
h = (beta/alpha)*exp(-eta*t/2)*sin(alpha*t);
h_s = laplace(h);
fe_s = laplace(e);
y_s = h_s*fe_s;
y = ilaplace(y_s);
Y = inline(y);
t = linspace(0,2);
%% comparación
% Señal de entrada usando las funciones de escalón y rampa 
u = -3.*(t>=2/18) + 3.*(t>=7/18) +3.*(t>=11/18) - 3.*(t>=16/18);
% Matrices
A = [0 1; xi -eta];
B = [0; xihat];
C = [1 0];
% Definición del sistema
sol = ss(A, B, C,0);
% Respuesta del sistema 
[yl, ~, xl] = lsim(sol, u, t, [0 0]);
plot(t,yl,t,Y(t),'--'), legend('Respuesta Simulada','Respuesta mediante convolución')
grid on
title('Expresión de y(t)')
%% Problema 1e
% Matrices
u00 = 0.5;
x33 = 0;
x11 = u0/R;
F3 =@(x,y,z,u) ki*x^2/(M*(l1-y+a))-(k/M)*(y-l0)-(d/M)*z;
x22 = fzero(@(t) F3(x11,t,x33,u0),l0);
x00 = [x11;x22;x33;u00];
A1 = [-R/L, 0, 0;
      0,  0,  1;
      2*ki.*x00(1)/(M*(l1-x00(2)+a)), (ki.*x00(1).^2)/(M*(l1-x00(2)+a)^2)-k/M, -d/M];
B1 = [1/L;
     0;
     0];
C1 = [0 1 0];
D1 = 0;
sys = idss(A1,B1,C1,D1,'Ts',0.5);
pzmap(sys)
h0 = C1*inv(-A1)*B1;
