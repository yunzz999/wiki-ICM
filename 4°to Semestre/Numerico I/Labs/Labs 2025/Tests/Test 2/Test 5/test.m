% Variables a evaluar
% sim
% defpos
% L43
% N
% y1
% x2
% R

A=[9,3,3,3;3,10,4,4;3,4,12,5;3,4,5,13];
b=[18,21,24,25]';
sim=double(issymmetric(A));
vp=eig(A);
defpos=1;
for i=1:length(vp)
    if(vp(i)<=0)
        defpos=0;
        break;
    end
end

if sim && defpos
    L_t=chol(A); 

    L=L_t';
    L43=L(4,3);
    N=norm(L*L_t-A);
    y=sustitucion_progresiva(L,b);
    y1=y(1);
    x=sustitucion_regresiva(L_t,y);
    x2=x(2);
    R=norm(A*x-b);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% FUNCIONES A UTILIZAR %%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%% SUSTITUCIÓN PROGRESIVA %%%%%%%%%%%%%%%%%%
function x = sustitucion_progresiva(L,b)

% function que permite resolver el sistema de ecuaciones Lx=b, donde L es
% una matriz triangular inferior, mediante sustitucion progresiva

% Habría que poner un criterio que me verifique si es que L es
% efectivamente una matriz triangular inferior
tri_inf = tril(L);
if norm(L-tri_inf) > 1e-6
    error('La matriz no es triangular inferior');
    return
end

% Inicializamos el vector de salida x
x = zeros(length(b),1);

% Ingresamos x1 "manualmente"
x(1) = b(1)/L(1,1);

for i = 2:length(b)
    % inicializamos la suma en una variable llamada suma
    suma = 0;
    for j = 1:i-1
        suma = suma + L(i,j)*x(j);
    end
    x(i) = (b(i) - suma)/L(i,i);
end
end

%%%%%%%%%%%%%%%%%% SUSTITUCIÓN REGRESIVA %%%%%%%%%%%%%%%%%%
function x = sustitucion_regresiva(U,y)

% function que permite resolver el sistema de ecuaciones Ux=y, donde U es
% una matriz triangular superior, mediante sustitucion regresiva

% Habría que poner un criterio que me verifique si es que U es
% efectivamente una matriz triangular superior
tri_sup = triu(U);
if norm(U-tri_sup) > 1e-6
    error('La matriz no es triangular superior');
    return
end

% Inicializamos el vector de salida x
x = zeros(length(y),1);

% Ingresamos xn "manualmente"
x(end) = y(end)/U(end,end);

for i = 1:length(y)-1
    % inicializamos la suma en una variable llamada suma
    suma = 0;
    for j = length(y)-i:length(y)
        suma = suma + U(end-i,j)*x(j);
    end
    x(end-i) = (y(end-i) - suma)/U(end-i,end-i);
end
end