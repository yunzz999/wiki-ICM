%% Dos péndulos unidos por un resorte
m1 = 1;  %masa 1 del péndulo 1
m2 = 1.5; %masa 2 del péndulo 2
k = 6; %constante elástica
L = 0.8; %longitud entre los ejes de los péndulos
l = 0.4; %ubicación del resorte a lo largo del péndulo
y0 = [pi/6, 0, pi/4,0]; %condiciones iniciales
g = 9.8; %Gravedad tspan = [0,10];
% y(1) = theta1; y(2) = dtheta1/dt; y(3) = theta2; y(4) = dtheta2/dt
f = @(t,y)[y(2);
    k*sin(y(1)-y(3))/(4*m1)-g*sin(y(1))/(2*l);
    y(4);
    -k*sin(y(1)-y(3))/(4*m2)-g*sin(y(3))/(2*l)];
[t,y] = ode45(f,tspan,y0);
hold on
plot(y(:,1),y(:,2))
plot(y(:,3),y(:,4))
hold off
grid on
legend('\theta_{1}','\theta_{2}');
xlabel('\theta_{1},\theta_{2}')
ylabel('d\theta_{1}/dt, d\theta_{2}/dt')
title('Angulos v/s Velocidad angular')
%% Dos péndulos unidos por un resorte: Animación
clear;close all; clc;
m1 = 1;  %masa 1 del péndulo 1
m2 = 1.5; %masa 2 del péndulo 2
k = 6; %constante elástica
L = 0.8; %longitud entre los ejes de los péndulos
l = 0.4; %ubicacion del resorte a lo largo del péndulo
y0 = [pi/6, 0, pi/4,0]; %condiciones iniciales
g = 9.8; %Gravedad 
tspan = [0,10];
% y(1) = theta1; y(2) = dtheta1/dt; y(3) = theta2; y(4) = dtheta2/dt
f = @(t,y)[y(2);
    k*sin(y(1)-y(3))/(4*m1)-g*sin(y(1))/(2*l);
    y(4);
    -k*sin(y(1)-y(3))/(4*m2)-g*sin(y(3))/(2*l)];
sol = ode45(f,tspan,y0);
% Péndulo p1
xp1 = @(t) -l*sin(deval(sol,t,1)); %posición del resorte en el péndulo p1 en el eje x
yp1 = @(t) -l*cos(deval(sol,t,1)); %posición del resorte en el péndulo p1 en el eje y
x1 = @(t) -2*l*sin(deval(sol,t,1)); %posición de la masa "m1" en el eje x
y1 = @(t) -2*l*cos(deval(sol,t,1)); %posición de la masa "m1" en el eje y
% Pendulo p2
xp2 = @(t) L-l*sin(deval(sol,t,3)); %posición del resorte en el péndulo p1 en el eje x
yp2 = @(t) -l*cos(deval(sol,t,3)); %posición del resorte en el péndulo p1 en el eje y
x2 = @(t) L-2*l*sin(deval(sol,t,3)) ;%posición de la masa "m2" eje x
y2 = @(t) -2*l*cos(deval(sol,t,3));%posición dela masa "m2" eje y
axis equal;
hold on;
fanimator(@(t) plot(x1(t),y1(t),'ro','MarkerSize',m1*10,'MarkerFaceColor','r'));
fanimator(@(t) plot([0 x1(t)],[0 y1(t)],'r-'));
fanimator(@(t) plot(x2(t),y2(t),'bo','MarkerSize',m2*10,'MarkerFaceColor','b'));
fanimator(@(t) plot([L x2(t)],[0 y2(t)],'b-'));
% resorte
fanimator(@(t) plot(linspace(xp1(t),xp2(t),21),[yp1(t) (yp1(t)*ones(1,19))+0.1*[ 1 0 -1 0 1 0 -1 0 1 0 -1 0 1 0 -1 0 1 0 -1] yp2(t)],'k'))
% placa superior
fanimator(@(t) plot([-0.5 L+0.5],[0 0],'k','LineWidth',4 ))
fanimator(@(t) text(-0.3,0.7,"Timer: "+num2str(t,2)));
hold off;
playAnimation