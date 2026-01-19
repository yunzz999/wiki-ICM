%
clear all; close all; clc
a = 0;
b = 1;
Dx = 1/8;
Dt = 1/8;
X = a:Dx:b;
T = a:Dt:b;
A = [0 1; 1 0];
v = [];
w = [];
f = @(x) sin(pi*x);
g = @(x) sin(pi*x);
for k = 1:length(X)
    v(k,1) = f(X(k));
end
for k = 1:length(X)
    w(k,1) = g(X(k));
end
lambda = Dt/Dx;
%Primero el metodo que sale primero
for j=2:length(X)-1
    for n = 1:length(T)
        v(j,n+1) = v(j,n)+lambda/2*(w(j+1,n)-w(j-1,n));
        w(j,n+1) = w(j,n) + lambda/2*(v(j+1,n)-v(j-1,n));
    end
end
%v(j,n+1) = v(j,n)+ (Dt)/(2*Dx)*

%Está la idea pero tengo que ver bien el tema de los índices

%Para el otro
vtilde = [];
wtilde = [];
for k = 1:length(X)
    vtilde(k,1) = f(X(k));
end
for k = 1:length(X)
    wtilde(k,1) = g(X(k));
end

for j=2:length(X)-1
    for n = 1:length(T)
        vtilde(j,n+1) = 1/2*(vtilde(j+1,n)+vtilde(j-1,n))+lambda/2*(wtilde(j+1,n)-wtilde(j-1,n));
        wtilde(j,n+1) = 1/2*(wtilde(j+1,n)+wtilde(j-1,n)) +lambda/2*(vtilde(j+1,n)-vtilde(j-1,n));
    end
end
%a = zeros(10,1)
%v = v(:,[1:9])
%surf(X,T,v)
u = @(x,t) 1/2*(sin(x+t)+sin(x-t))+1/(2*pi)*(sin(pi*(x+t))-sin(pi*(x-t)))
