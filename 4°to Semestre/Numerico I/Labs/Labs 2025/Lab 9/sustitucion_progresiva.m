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