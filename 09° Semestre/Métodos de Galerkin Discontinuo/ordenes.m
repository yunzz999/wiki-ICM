clear all; close all; clc;
a = 0;
b = 1;
%termino fuente f(x)
f = @(x) pi.^2.*sin(pi.*x) -exp(x);

%solucion exacta para comparar
u = @(x) sin(pi.*x) + exp(x); %solucion exacta
du = @(x) pi.*cos(pi.*x) + exp(x); %derivada solucion exacta

%condiciones de contorno
g1 = u(a);
g2 = u(b);

M = 2.^[2:4];
errorL2 = [];
normaH1 = [];
h = [];
for j = 1 : length(M)
    [errorL2(j),normaH1(j),h(j)] = fem1d(M(j),a,b,f,u,du,g1,g2);
end
rL2 = log(errorL2(1:end-1)./errorL2(2:end))./log(h(1:end-1)./h(2:end));
rH1 = log(normaH1(1:end-1)./normaH1(2:end))./log(h(1:end-1)./h(2:end));