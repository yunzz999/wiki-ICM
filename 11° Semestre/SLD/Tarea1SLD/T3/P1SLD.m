clear; clc;
R = 0.5; L = 0.05; a = 0.02; 
ki = 3*10^(-3);l1 =0.5; l0 = 0.3;
M = 0.25; k = 24.5; d = 1.5;
%% Problema 1a
% Punto de operación
u0 = 0.3;
x3 = 0;
x1 = u0/R;
F3 =@(x,y,z,u) ki*x^2/(M*(l1-y+a))-(k/M)*(y-l0)-(d/M)*z;
x2 = fzero(@(t) F3(x1,t,x3,u0),l0);
x0 = [x1;x2;x3;u0]; % punto de operación
% Matrices
A = [-R/L, 0, 0;
      0,  0,  1;
      2*ki.*x0(1)/(M*(l1-x0(2)+a)), (ki.*x0(1).^2)/(M*(l1-x0(2)+a)^2)-k/M, -d/M];
B = [1/L;
     0;
     0];
C = eye(3,3);
D = 0;
% Definición del sistema
sys = ss(A,B,C,D);
% Función de transferencia
h = tf(sys(2));
% Diagrama de Bode
figure;
bode(h);
grid on;
hold on;
plot([0.1 100], [0 0], 'k--');
plot([0.1 100], [0 0], 'k--');
xlabel('Frecuencia (rad/s)');
ylabel('Magnitud (dB)');
title('Diagrama de Bode');
%% Problema 1b
T0 = 1; 
f0 = 1/T0;
t=linspace(0,2 ,1000);  
e0 = x0(3);
e = e0 * heaviside(t) + sin(2*pi*f0*t) - 1/5*sin(10*2*pi*f0*t);
[mag, phase, wout] = bode(sys, 2*pi*[f0 10*f0 0]); 
mag_dB = 20*log10(mag); 
phase_deg = rad2deg(phase); 
save('bode_results.mat', 'mag', 'mag_dB', 'phase_deg');
xss_dc = e0*mag(3)*heaviside(t);
xss_f0 = (db2mag(mag_dB(1))*sin(2*pi*f0*t + deg2rad(phase_deg(1))));
xss_10f0 = (db2mag(mag_dB(2))*sin(2*pi*10*f0*t + deg2rad(phase_deg(2)))); 
xss = xss_dc + xss_f0 - (1/5)*(xss_10f0);
title('Problema 1.b')
subplot(2,1,1)
plot(t, xss, 'LineWidth',2);
hold on
title('xss(t)')
grid on
sgtitle('Problema 1b') 
xlabel('Tiempo');
ylabel('Amplitud');
subplot(2,1,2)
plot(t, e, 'LineWidth',2);
xlabel('Tiempo');
ylabel('Amplitud');
grid on;
title('e(t)')
%% Problema 1c
x_ss = [x0(1); x0(2); x0(3)]; 
y = lsim(sys(1), e, t, x_ss); 
figure;
subplot(2,1,1)
plot(t, y,'LineWidth',2);
hold on;
xlabel('Tiempo');
ylabel('Amplitud');
title('y(t)')
grid on 
subplot(2,1,2)
plot(t, e,'LineWidth',2);
sgtitle('Problema 1c')
title('e(t)')
xlabel('Tiempo');
ylabel('Amplitud');
grid on
figure
plot(t, y,t,xss,'LineWidth',1);
title('Comparación entre xss(t) y x(t).')
xlabel('Tiempo');
ylabel('Amplitud');
legend('xss','x')
grid on 
%% Problema 1d y 1e
s1=-10;
s2=-3+9.2019j;
s3=-3-9.2019j;
T = 0.025;
z1 = exp(s1*T);
z2 = exp(s2*T);
z3 = exp(s3*T);
dcg = dcgain(sys(1));
mu = dcg*(1-z1)*(1-z2)*(1-z3);
denom = @(z) z^3 + z^2*(-z1-z2-z3) + z*(z1*z2+z1*z3+z2*z3) -z1*z2*z3;
discretenum = mu;
discretedenom = [1 (-z1-z2-z3) (z1*z2+z1*z3+z2*z3) -z1*z2*z3 ];
sysd = c2d(sys(1),0.025);
save('bode_results.mat', 'mag', 'mag_dB', 'phase_deg');
dsys = tf(discretenum, discretedenom, 0.025);
figure('Name','Bode discreto');
bode(sys(1),'r',dsys,'b--')
hold on 
xline(pi/T, '--r', 'Visible', false)
grid on
leg = legend({'Continuo','Discreto'});
%% Problema 1 f
close all;
T0 = 1; 
f0 = 1/T0;
t=linspace(0,2.5 ,1000);  
e0 = x0(3);
e = e0 * heaviside(t) + (sin(2*pi*f0*t) - 1/5 * sin(10*2*pi*f0*t));
[dmag, dphase, dwout] = bode(dsys, 2*pi*[f0 10*f0 0]); 
dmag_dB = 20*log10(dmag); 
dphase_deg = rad2deg(dphase); 

dxss_dc = e0*dmag(3) * heaviside(t);
dxss_f0 = (db2mag(dmag_dB(1)) * sin(2*pi*f0*t + deg2rad(dphase_deg(1))));
dxss_10f0 = (db2mag(dmag_dB(2)) * sin(2*pi*10*f0*t + deg2rad(dphase_deg(2)))); 

dxss = dxss_dc + dxss_f0 - (1/5)*(dxss_10f0);
title('Problema 1f')
subplot(2,1,1)
plot(t, dxss,'--', 'LineWidth',2);
hold on
title('xss(t) discreta')
grid on
sgtitle('Problema 1f') 
xlabel('Tiempo');
ylabel('Amplitud');
subplot(2,1,2)
plot(t, e,'--', 'LineWidth',2);
xlabel('Tiempo');
ylabel('Amplitud');
grid on;
