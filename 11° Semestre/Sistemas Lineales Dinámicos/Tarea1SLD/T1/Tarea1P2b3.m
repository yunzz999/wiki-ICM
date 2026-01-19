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
%% Señal de entrada usando las funciones de escalón y rampa
e = t==10*T;

%% Definición del sistema
circuito = ss(A, B, C, D, T);

%% Respuesta del sistema partiendo del reposo con entrada función escalón y rampa
[y, ~, x] = lsim(circuito, e, t, [0 0]);

%% Graficos
figure;
subplot(3,1,1);
plot(t, e);
legend('Entrada');
grid on
title('Respuesta del sistema');

subplot(3,1,2);
plot(t, x(:,1));
legend('Voltaje capacitor');
grid on
subplot(3,1,3);
plot(t, x(:,2));
legend('Corriente inductor');
grid on