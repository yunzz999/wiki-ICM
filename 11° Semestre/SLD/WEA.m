% Parametros
R = 12;
L = 5e-3;
C = 200e-6;
% Puntos de op.
u0 = 0.5;
p0 = 6;
x10 = p0/(1 - u0);
x20 = x10/(R*(1 - u0));
% Entradas
t = linspace(0, 100e-3, 1000); % Vector de tiempo
u = u0*(t>=0) + 0.5*u0*(t>=60e-3);
p = p0*(t>=0) - 0.5*p0*(t>=20e-3);
% Respuesta del sistema no lineal partiendo del punto de op.
[~,x_nl] = ode45(@elevador_nolineal,t,[x10 x20]);
%plot(t,u,t,p), legend('Entrada','Perturbación')
plot(t,x_nl(:,1)), legend('Voltaje capacitor')
