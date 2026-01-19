% Problema 5
tic
clear all; close all; clc
Dx = 0.05;
LM = 1/6;
Dt = Dx^2*LM;
X = 0:Dx:1;
T = 0:Dt:1;
f = @(x) sin(x*pi);
g = @(t) t*(1-t)^2;
gtilde = @(t) t;
N = 1/Dx-1;
M = length(T);
alpha = 0;
[X1,T1, U1, M1] = Paso_simple_ec_calor(f,g,gtilde,0.05,1/12,1/2);
[X2,T2, U2, M2] = Paso_simple_ec_calor(f,g,gtilde,0.05,1/6,0);
[X3,T3, U3, M3] = Paso_simple_ec_calor(f,g,gtilde,0.005,1/6,0);

toc
plot(X1(2:end-1),U1(:,length(U1)),'o')
hold on
plot(X2(2:end-1),U2(:,length(U2)),'o')
plot(X3(2:end-1),U3(:,length(U3)),'-', 'Color','r')
%plot(X2,U2(:,length(U2))
%plot(X3,U3(:,length(U3))
legend('\alpha = 1/2, \lambda = 1/12','\alpha = 0, \lambda = 1/6','Referencia')
