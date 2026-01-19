clear all;close all;clc;
dx = 0.05; alpha = 1/2; lambda = 1/12;
dt = lambda*(dx)^2;N = (1/dx);
x = [0:dx:1];
t = [0:dt:1];
B = diag((-1)*(ones(1,N-2)),1) + diag(2*ones(1,N-1)) + diag((-1)*(ones(1,N-2)),-1);
I = eye(N-1);
g = zeros(N-1,length(t));
% vector g_{n}
for i = 0:length(t)-1
    g(1,i+1) = i*dt*(1-i*dt)^2 + alpha*((i+1)*dt*(1-(i*dt))^2 - i*dt*(1-i*dt)^2);
    g(19,i+1) = i*dt + alpha*((i+1)*dt - i*dt);
end
u = zeros(N-1,length(t));
% Vector de valores iniciales
for k = 0:N-2
    u(k+1,1) = sin(pi*k*dx);   
end
% Algoritmo para obtener la matriz u
% A = inv(I + alpha*lambda*B);

for j = 1:length(t)-1
    u(:,j+1) = (inv(I + alpha*lambda*B))*(I-(1-alpha)*lambda*B)*u(:,j)+(inv(I + alpha*lambda*B))*lambda*g(:,j);
end
% x = linspace(0,1,N+1);
% y = linspace(0,1,N+1);
u0 = ones(1,length(t));
u1 = ones(1,length(t));
for l = 0:length(u0)-1
    r = l*dt;
    u0(l+1) = r*(1-r)^2; 
    u1(l+1) = r;
end    
uu = [u0;u;u1];
plot(x,uu(:,480))