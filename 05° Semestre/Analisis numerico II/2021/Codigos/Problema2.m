clear all;close all;clc;
%P D2
n = 15;
h = 1/(n+1);
b = 2;c = 5;d = 3;
a11 = 3 + c*h^2;
la = -1-b*h/2;
aii = 4+c*h^2;
ua = -1+b*h/2;
ann = 3-b*h/2 + c*h^2;  
bnn = 1-d/h;
S = aii*diag(ones(1,n)) + la*diag(ones(1,n-1),-1)  + ua*diag(ones(1,n-1),1);
S(1,1) = a11;
S(n,n) = ann;
M = eye(n,n);
M(n,n) = bnn;
A = kron(eye(n),S);
A = A + diag(-1*ones(n^2-6,1),-6) + diag(-1*ones(n^2-6,1),6);
A = (1/h^2)*A;
D = kron(eye(n),M);
B = (-1/h^2)*diag(D);
z = A\B;
u = zeros(n^2,1);
max_iterations = 100000; 
threshold = h;
%GMRES
x = linspace(0,1,n);
y = linspace(0,1,n);
tic
[SGMREs, e] = gmres( A, B, u, max_iterations, threshold);
toc
SGMRES = reshape(SGMREs,[n,n]);
surf(x,y,SGMRES)
title('Aprximacion mediante GMRES');
axis on
grid on
% GAUSS-SEIDEL
tic
[SGs,convergencia,iteraciones] = gauss_seidel(A,B,u,h,max_iterations);
toc;
% SJC = Jacobi(A,B,u,10^-10,max_iterations);
SGS = reshape(SGs,[n,n]);
surf(x,y,SGS)
title('Aprximacion mediante GS');
axis on
grid on
%ELIMINACION GAUSSIANA
tic
SEg = eliminacion(A,B);
toc 
SEG = reshape(SEg,[n,n]);
surf(x,y,SEG)
title('Aprximacion mediante EG');
axis on
grid on
%GCP
tic
[SGCp,M] = GCP(A,B);
toc
SGCP = reshape(SGCp,[n,n]);
surf(x,y,SGCP)








