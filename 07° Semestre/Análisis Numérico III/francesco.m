% #### 1)
% # datos: y0: vetor de valores iniciales, a: t inicial, b: t final
y0 = [0;0;0];
a = 0;
b = 21;
% funcion parte derecha del PVI
f = @(t,L) [-3.6.*L(1) + 1.2.*(L(2).*(1-L(2).^2)-1);
            -1.2.*L(2) + 6.*(L(1) + 2./(1+L(3)));
            -0.12.*L(3) + 12.*L(2)];

% Calculando solucion de referencia
options = odeset('AbsTol',1e-10,'RelTol',1e-10);
[tex,yex] = ode45(f,[a,b],y0,options);
yex = yex';

% Graficando solución de referencia
% Componente 1 en figura 1
figure(1)
plot(tex,yex(1,:));
legend('Solucion de referencia para P(t)')
title('Solucion de referencia')
hold on

% Componente 2 en figura 2
figure(2)
plot(tex,yex(2,:));
legend('Solucion de referencia para L(t)')
title('Solucion de referencia')
hold on

% Componente 3 en figura 3
figure(3)
plot(tex,yex(3,:));
legend('Solucion de referencia para Z(t)')
title('Solucion de referencia')
hold on
% #### 2)
% # h: tamaño de paso
h = 0.1;
[X Y]  = EulerExplicito(f,y0,a,b,h);
% #### 3)
% # h: tamaño de paso
h = 0.005;
[X1 Y1]  = EulerExplicito(f,y0,a,b,h);
% Componente 1 en figura 4
figure(4)
plot(tex,yex(1,:),'b',X1,Y1(1,:),'c');
legend('Solucion de referencia para L(t)','Solucion aproximada de L(t)')
title('Euler explicito vs solucion de referencia')
grid on
hold on

% Componente 2 en figura 5
figure(5)
plot(tex,yex(2,:),'b',X1,Y1(2,:),'c');
legend('Solucion de referencia para P(t)','Solucion aproximada de P(t)')
title('Euler explicito vs solucion de referencia')
grid on
hold on

% Componente 3 en figura 6
figure(6)
plot(tex,yex(3,:),'b',X1,Y1(3,:),'c');
legend('Solucion de referencia para Z(t)','Solucion aproximada de Z(t)')
title('Euler explicito vs solucion de referencia')
grid on
hold on

% #### 4)
% # al ver la figura que describe el amor de francesco hacia laura podemos notar 
% # que no es constante, mas bien pasa por altos y bajos, por lo que no se refleja
% # en el modelo la pasion constante de francesco hacia laura.
% 
