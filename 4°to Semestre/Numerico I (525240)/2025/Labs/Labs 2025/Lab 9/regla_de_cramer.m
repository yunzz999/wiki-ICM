function x = regla_de_cramer(A,b)

% función para resolver el sistema de ecuaciones Ax=b con la Regla de
% Cramer (mal ejemplo desde el punto de vista del costo operacional)

% tamaño del sistema de ecuaciones
n = length(b);

% Inicializamos la variable de salida
x = zeros(n,1);

% Ciclo para determinar el valor de las incógnitas
d = det(A);
B = A;
for i = 1:n
    B(:,i) = b;
    x(i) = det(B)/d;
    B = A;
end



