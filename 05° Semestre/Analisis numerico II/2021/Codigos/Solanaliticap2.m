clear all;close all;clc;
c = 5;d = 3;
A = [1 1;-sqrt(c)*exp(sqrt(c)) sqrt(c)*exp((-1)*sqrt(c))];
b = [-1/c; d];
x = A\b;
c1 = x(1);
c2 = x(2);
u = @(t) c1*exp(sqrt(c)*t) + c2*exp((-1)*sqrt(c)*t) + 1/c;
t = linspace(0,1);
plot(t,u(t))