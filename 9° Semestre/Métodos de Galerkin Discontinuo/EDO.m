clear all; close all; clc;
a = 0;
b = 1;
gamma = 400;
%termino fuente f(x)
f = @(x) pi.^2.*cos(pi.*x);

%solucion exacta para comparar
w = @(x) cos(pi.*x); %solucion exacta
dw = @(x) pi.*sin(pi.*x); %derivada solucion exacta

%condiciones de contorno
g1 = w(a);
g2 = w(b);
M = 17;
[errorL21,errorDG1,h1] = IPDG(65,a,b,f,w,dw,g1,g2,gamma);
[errorL22,errorDG2,h2] = IPDG(129,a,b,f,w,dw,g1,g2,gamma);
rl = log(errorL21/errorL22)/log(h1/h2);
rdg = log(errorDG1/errorDG2)/log(h1/h2);
