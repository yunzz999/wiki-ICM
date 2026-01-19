P1 = input('Ingrese coeficientes del primer polinomio [a_n ... a_0]: ');
P2 = input('Ingrese coeficientes del segundo polinomio [b_m ... b_0]: ');
syms x;  
P1=poly2sym(P1,x);
P2=poly2sym(P2,x);
                    

% Inicializar variables 
r0 = P1;
r1 = P2;
s0 = 1; s1 = 0;   
t0 = 0; t1 = 1;  

% Iterar hasta que r1 sea cero:
while r1 ~= 0
    [q, r2] = quorem(r0, r1, x);  % División polinómica: r0 = q*r1 + r2
    r2 = expand(r2);             
    
    % Actualizar residuos
    r0 = r1;
    r1 = r2;
    % Actualizar coeficientes de Bézout
    s2 = s0 - q*s1;
    t2 = t0 - q*t1;
    s0 = s1;
    s1 = s2;
    t0 = t1;
    t1 = t2;
end

%Resultados
G = r0;     % MCD 
A = s0;     % Coeficiente de Bézout para P1
B = t0;     % Coeficiente de Bézout para P2

% Pasar a MCD mónico:
coeffsG = coeffs(G, x);
lc = coeffsG(1);
G = G / lc;
A = A / lc;
B = B / lc;
%Mostrar resultados
disp(coeffs(G,x,'All'));
disp(coeffs(A,x,'All'));
disp(coeffs(B,x,'All'));
