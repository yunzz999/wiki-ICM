% Rutero para comparar tiempos entre Eliminación Gaussiana y
% Regla de Cramer

clear all
clc

% N = 100
N = 100;
A = matriz_ejercicio0(N,4,-1,-1);
b = [1;(2:N-1)';1];

tic
x_gauss_100 = A\b;
tiempo_gauss_100 = toc

tic
x_cramer_100 = regla_de_cramer(A,b);
tiempo_cramer_100 = toc

comparacion_100 = tiempo_cramer_100/tiempo_gauss_100

% N = 700
N = 700;
A = matriz_ejercicio0(N,4,-1,-1);
b = [1;(2:N-1)';1];

tic
x_gauss_700 = A\b;
tiempo_gauss_700 = toc

tic
x_cramer_700 = regla_de_cramer(A,b);
tiempo_cramer_700 = toc

comparacion_700 = tiempo_cramer_700/tiempo_gauss_700

% N = 1500
N = 1500;
A = matriz_ejercicio0(N,4,-1,-1);
b = [1;(2:N-1)';1];

tic
x_gauss_1500 = A\b;
tiempo_gauss_1500 = toc

tic
x_cramer_1500 = regla_de_cramer(A,b);
tiempo_cramer_1500 = toc

comparacion_1500 = tiempo_cramer_1500/tiempo_gauss_1500