clear all;close all;clc;
b = 0;c = 5;d = 3;
rmas = (b + sqrt(b^2 + 4*c))/2;
rmenos = (b - sqrt(b^2 + 4*c))/2;  
A = [((b-rmas)*exp(rmas)) ((b-rmenos)*exp(rmenos));1 1];
B = [d - b/c ; -1/c];
X = A\B;
c1 = X(1);
c2 = X(2);
u = @(x) c1*exp(rmas*x) + c2*exp(rmenos*x) + 1/c;
x = linspace(0,1);
plot(x,u(x))
u1 = u(1);