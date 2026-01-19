clear all;close all;clc;
dx = 0.05; c = 2;
dt = dx/c; % Condicion CFL
lambda = dt/dx;
x = [-6:dx:6];%Dominio comptacional
t = [0:dt:2];%Dominio comptacional
N = 2/dt;
J = 6/dx;
u = zeros(2*J+1,N+1);%Definimos la matriz de "aproximación"
                      %donde la columna (n+1)-esima reperesenta la solucion aproximada
                      %de u(x,n*delta t) con n = {0,...,80}
% u(:,1) = ones(1,2*J+1);
for i = 1:J %Aqui desarrollamos u_{j,0}(condicion inicial)
   if i*dx > 0 && i*dx < 1
       u(i+1+J,1) = 1+sin(i*dx/pi);
   else 
       u(i,1) = 0;
   end    
end
% plot(x,u(:,1))
for k = 2:2*J %desarollamos u_{j,1} (solucion aproximada de u(x,0.025))
   u(k,2) = (1+dt*(1/2))*u(k,1)+(1/2)*((c*lambda)^(2))*(u(k-1,1)-2*u(k,1)+u(k+1,1))+(1/12)*dt*((c*lambda)^(2))*(u(k-1,1)-2*u(k,1)+u(k+1,1)); 
end    
% plot(x,u(:,2))
for n = 2:(length(t)-1) %Aplicamos el metodo de diferencias (5.38)
   for j = 2:(length(x)-1)
      u(j,n+1) = 2*(1-(c*lambda)^2)*u(j,n) + ((c*lambda)^2)*(u(j+1,n)+u(j-1,n)) - u(j,n-1); 
   end    
end    
plot(x,u(:,length(t)),'LineWidth',1.4)%Grafico de la aproximación pedida
str = 'Aproximación ecuación de la onda';
title(str,'interpreter','latex')
legend('$u_{j,80}$','interpreter','latex')
grid on