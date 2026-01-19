% Calcula el máximo común divisor de los polinomios P1 y P2.
P1 = input('Ingrese coeficientes del primer polinomio [a_n ... a_0]: ');
P2 = input('Ingrese coeficientes del segundo polinomio [b_m ... b_0]: ');
syms x;  
P1=poly2sym(P1,x);
P2=poly2sym(P2,x);
                    
% Algoritmo de Euclides para polinomios:
while P2 ~= 0
    [Q,R] = quorem(P1, P2, x); 
    R = expand(R);              
    P1 = P2;                    
    P2 = R;                     
end

%Pasar a MCD monico
D = P1;                       
coeffsD = coeffs(D, x,'All');       
scale = 1/coeffsD(1);              
scaled=coeffsD*scale;                       
disp('MCD:');
disp(scaled);

