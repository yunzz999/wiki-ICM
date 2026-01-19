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
cero = roots([1 eta -xi]);
h =@(t) exp(-eta.*t./2).*sin(alpha.*t);
t = linspace(0,1);
%plot(t,hh(t))
 plot(t,h(t)),legend('h(t)');
% grid on
% title('Expresión exacta de h(t)')
%% Matrices
A = [0 1; xi -eta];
B = [0; xihat];
C = [1 0];
D = [0];
sys = idss(A,B,C,D,'Ts',0.5);
pzmap(sys)
ltiSys = ss(A,B,C,D);
syss = tf(ltiSys);
t = 0:0.01:2;
%u = sin(10.*t);
u =@(t) -3.*(t>=2/18) + 3.*(t>=7/18) +3.*(t>=11/18) - 3.*(t>=16/18);
lsim(syss,u(t),t)