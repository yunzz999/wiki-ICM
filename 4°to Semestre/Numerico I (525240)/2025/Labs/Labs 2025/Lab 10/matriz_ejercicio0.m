function A = matriz_ejercicio0(n,a,b,c)

% Función que crea la matriz tridiagonal de n filas y n columnas, con
% coeficientes a en su diagonal, b encima de la diagonal, y c debajo de la
% diagonal.

% Inicializamos la matriz A (típicamente se hace con una matriz de ceros)
A = zeros(n);

% Ciclo para llenar la diagonal
for i = 1:n
    A(i,i) = a;
end

% Ciclo para llenar las posiciones encima y debajo de la diagonal
for i = 2:n
    A(i-1,i) = b;
    A(i,i-1) = c;
end

end