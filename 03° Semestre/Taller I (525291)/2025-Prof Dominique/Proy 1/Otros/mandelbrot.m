% mandelbrot.m
% Genera el conjunto de Mandelbrot y exporta la imagen resultante

% Parámetros
maxIter = 2000;          % Número máximo de iteraciones
xlim = [-2, 1];          % Límite en el eje x
ylim = [-1.5, 1.5];      % Límite en el eje y
res = 1000;              % Resolución (píxeles por eje)

% Crear malla de puntos complejos
x = linspace(xlim(1), xlim(2), res);
y = linspace(ylim(1), ylim(2), res);
[X, Y] = meshgrid(x, y);
C = X + 1i * Y;

% Inicializar matrices
Z = zeros(size(C));
M = zeros(size(C));  % Almacena el número de iteración de escape

% Cálculo del conjunto
for k = 1:maxIter
    mask = abs(Z) <= 2;
    Z(mask) = Z(mask).^2 + C(mask);
    M(mask & (M == 0)) = k;
end

% Visualización (sin mostrar figura en pantalla)
fig = figure('Visible', 'off');
imagesc(xlim, ylim, log(M));
axis equal off;
colormap(hot);
colorbar;
title('Conjunto de Mandelbrot');

% Exportar la imagen a PNG con resolución 300 dpi
exportgraphics(fig, 'mandelbrot.png', 'Resolution', 300);

% Opcional: cerrar la figura
close(fig);
