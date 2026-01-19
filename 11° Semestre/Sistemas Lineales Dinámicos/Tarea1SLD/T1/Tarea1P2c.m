clear; clc;
%% Matrices
A = [0.775 8.327;
    -0.042 0.609];
B = [0.225; 
    0.042];
C = [1 0];
D = 0;
%% Parámetros de simulación
T = 0.02; % Paso de tiempo de la simulación
k = 0:250; % Vector de tiempo
t = k*T;
%% Simulación ciruito
e = 2.*(t>=5.*T) + 10.*((t-15.*T).*(t>=15.*T)) - 10.*((t-25.*T).*(t>=25.*T)) - 5.*((t-35.*T).*(t>=35.*T)) + 5.*((t-40.*T).*(t>=40.*T));
circuito = ss(A, B, C, D, T);
[y, ~, x] = lsim(circuito, e, t, [0 0]);
%% Simulacion de la superposición
% Primer sistema
e1 = 2.*(t>=5.*T);
circuito1 = ss(A, B, C, D, T);
[y1, ~, x1] = lsim(circuito1, e1, t, [0 0]);
% Segundo sistema
e2 = 10.*((t-15.*T).*(t>=15.*T));
circuito2 = ss(A, B, C, D, T);
[y2, ~, x2] = lsim(circuito2, e2, t, [0 0]);
% Tercer sistema
e3 = -10.*((t-25.*T).*(t>=25.*T));
circuito3 = ss(A, B, C, D, T);
[y3, ~, x3] = lsim(circuito3, e3, t, [0 0]);
% Cuarto sistema
e4 = -5.*((t-35.*T).*(t>=35.*T));
circuito4 = ss(A, B, C, D, T);
[y4, ~, x4] = lsim(circuito4, e4, t, [0 0]);
% Quinto sistema
e5 = 5.*((t-40.*T).*(t>=40.*T));
circuito5 = ss(A, B, C, D, T);
[y5, ~, x5] = lsim(circuito5, e5, t, [0 0]);
% Superposición
xs = x1+x2+x3+x4+x5;
% verificación
error1 = norm(x(:,1)-xs(:,1));
error2 = norm(x(:,2)-xs(:,2));



%% Graficos
figure;
subplot(2,1,1);
plot(t, x(:,1),t,xs(:,1));
legend('Voltaje capacitor');
title('Respuesta del sistema');
grid on
subplot(2,1,2);
plot(t, x(:,2),t,xs(:,2));
legend('Corriente inductor');
grid on