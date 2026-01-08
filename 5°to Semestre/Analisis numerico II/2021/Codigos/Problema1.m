clear all;close all;clc;
%P D1
n = 150; %tamaño de la matriz
h = 1/(n+1); %Espacio entre cada punto
b = 2;c = 5;d = 3; % valores de las constantes
a11 = 3 + c*h^2; 
la = -1-b*h/2;    % valor de la primera subdiagonal de A
aii = 4+c*h^2;     % valor de los elementos de la diagonal de A 
ua = -1+b*h/2;     % Valor de la diagonal que esta sobre la diagonal de A
ann = 3-b*h/2 + c*h^2;  
bnn = 1-d/h;             
A = aii*diag(ones(1,n)) + la*diag(ones(1,n-1),-1)  + ua*diag(ones(1,n-1),1); %Construccion de A
A(1,1) = a11; % Primer elemnto de la matriz A
A(n,n) = ann; % Valor del ultimo elemnto de A
B = eye(n,n);
B(n,n) = bnn; %Valor del ultimo elemento de b
A = (1/h^2)*A;
B = (-1/h^2)*diag(B);
u = zeros(n,1);
max_iterations = 1000; 
threshold = h;
%GMRES
tic
[SGMRES, e] = gmres( A, B, u, max_iterations, threshold); %Solucion de A\b mediante GMRES
toc
%GAUSS-SEIDEL
tic
[SGS,convergencia,iteraciones] = gauss_seidel(A,B,u,h,max_iterations); %Solucion de A\b mediante Gauss-Seidel
toc;
%ELIMINACION GAUSSIANA
tic
SEG = eliminacion(A,B); %Solucion de A\b mediante Eliminacion Gaussiana
toc 
%GCP
tic
[SGCP,M] = GCP(A,B); %Solucion de A\b mediante Gradiente Conjugado Precondicionado
toc
%Graficos
x = linspace(0,1,n);
plot(x,SGMRES,'--')
hold on
plot(x,SEG,'o')
plot(x,SGS,'b.')
plot(x,SGCP,'c+')
grid on
legend('GMRES','EG','GS','GCP')
title('Aproximacion mediante GMRES, EG, GS y GCP')



