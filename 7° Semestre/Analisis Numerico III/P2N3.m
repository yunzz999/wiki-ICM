clear all;close all;clc;
dx = 0.05; alpha = 1/2; lambda = 1/12;
dt = lambda*(dx)^2;x = [0:dx:1];t = [0:dt:1];
N = (1/dx) - 1;
B = diag((-1)*(ones(1,N-1)),1) + diag(2*ones(1,N)) + diag((-1)*(ones(1,N-1)),-1);
I = eye(N);
g = zeros(N,length(t));
u = zeros(N,length(t));
for j = 1:N
    y = j*dx;
   u(j,1) =  sin(y*pi);
end    
g = zeros(N,length(t));% matriz que contiene a los g_{n}
% vector g_{n}
for i = 0:length(t)-1
    g(1,i+1) = i*dt*(1-i*dt)^2 + alpha*((i+1)*dt*(1-(i*dt))^2 - i*dt*(1-i*dt)^2);
    g(19,i+1) = i*dt + alpha*((i+1)*dt - i*dt);
end
%Calculo de u
for k = 1:length(t) %Claculo de los u_{n}
   u(:,k+1) = (I+2*B)\((I-2*B)*u(:,k) + 4*g(:,k)); 
end
u0n = ones(1,length(t));
u1n = ones(1,length(t));
for l = 0:length(u0n)
    r = l*dt;
    u0n(l+1) = r*(1-r)^2; 
    u1n(l+1) = r;
end    
U = [u0n;u;u1n]; 
plot(x,U(:,4802),'b*')
hold on
grid on
% Caso alpha = 0 y lamda = 1/6
dx2 = 0.05; alpha2 = 0; lambda2 = 1/6;
dt2 = lambda2*(dx2)^2;x2 = [0:dx2:1];t2 = [0:dt2:1];
N2 = (1/dx2) - 1;
B2 = diag((-1)*(ones(1,N-1)),1) + diag(2*ones(1,N)) + diag((-1)*(ones(1,N-1)),-1);
I2 = eye(N);
g2 = zeros(N2,length(t2));
u2 = zeros(N2,length(t2));
for j = 1:N
    y = j*dx;
   u2(j,1) =  sin(y*pi);
end    
g2 = zeros(N2,length(t2));
% vector g_{n}
for i = 0:length(t)-1
    g2(1,i+1) = i*dt2*(1-i*dt2)^2 + alpha2*((i+1)*dt2*(1-(i*dt2))^2 - i*dt2*(1-i*dt2)^2);
    g2(19,i+1) = i*dt2 + alpha2*((i+1)*dt2 - i*dt2);
end
%Calculo de u
for k = 1:length(t2)
   u2(:,k+1) = (I2+2*B2)\((I2-2*B2)*u2(:,k) + 4*g2(:,k)); 
end
u0n2 = ones(1,length(t2));
u1n2 = ones(1,length(t2));
for l = 0:length(u0n2)
    r = l*dt2;
    u0n2(l+1) = r*(1-r)^2; 
    u1n2(l+1) = r;
end    
U2 = [u0n2;u2;u1n2];
plot(x,U2(:,2402),'ro')
%Solucion referencia
dx3 = 0.05; alpha3 = 0; lambda3 = 1/6;
dt3 = lambda3*(dx3)^2;x3 = [0:dx3:1];t3 = [0:dt3:1];
N3 = (1/dx3) - 1;
B3 = diag((-1)*(ones(1,N-1)),1) + diag(2*ones(1,N)) + diag((-1)*(ones(1,N-1)),-1);
I3 = eye(N);
g3 = zeros(N3,length(t3));
u3 = zeros(N3,length(t3));
for j = 1:N
    y = j*dx;
   u3(j,1) =  sin(y*pi);
end    
g3 = zeros(N3,length(t3));
% vector g_{n}
for i = 0:length(t)-1
    g3(1,i+1) = i*dt3*(1-i*dt3)^2 + alpha3*((i+1)*dt3*(1-(i*dt3))^2 - i*dt3*(1-i*dt3)^2);
    g3(19,i+1) = i*dt3 + alpha3*((i+1)*dt3 - i*dt3);
end
%Calculo de u
for k = 1:length(t3)
   u3(:,k+1) = (I3+2*B3)\((I3-2*B3)*u3(:,k) + 4*g3(:,k)); 
end
u0n3 = ones(1,length(t3));
u1n3 = ones(1,length(t3));
for l = 0:length(u0n3)
    r = l*dt3;
    u0n3(l+1) = r*(1-r)^2; 
    u1n3(l+1) = r;
end    
U3 = [u0n3;u3;u1n3];
plot(x,U3(:,2402),'g')
legend('$\lambda = 1/12, \alpha = 1/2$','$\lambda = 1/6, \alpha = 0$','referencia','interpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$u(x,1)$','interpreter','latex')