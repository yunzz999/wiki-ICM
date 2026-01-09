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