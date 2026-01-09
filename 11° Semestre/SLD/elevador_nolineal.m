function dx = elevador_nolineal(t,x)
% Parametros
R = 12;
L = 5e-3;
C = 200e-6;
% Puntos de op.
u0 = 0.5;
p0 = 6;
% Entradas
u = u0*(t>=0) + 0.5*u0*(t>=60e-3);
p = p0*(t>=0) - 0.5*p0*(t>=20e-3);
% Ecuaciones de estado
dx(1) = (1 - u)/C*x(2) - x(1)/(C*R);
dx(2) = p/L - (1 - u)/L*x(1);
dx = [dx(1) dx(2)]';
end