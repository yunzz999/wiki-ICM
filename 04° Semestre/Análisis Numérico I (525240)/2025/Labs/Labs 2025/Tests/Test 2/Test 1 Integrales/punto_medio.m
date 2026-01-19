function I = punto_medio(a,b,f,n)

% Función que aproxima la integral de la función f entre a y b usando
% la regla del punto medio compuesta con n subintervalos. Si n=1 entonces
% se aplica la regla elemental. La entrada f debe ser entregada como
% function handle

h = (b-a)/n; % Longitud de cada subintervalo

x = a + h*(0:n); % Partición del intervalo [a,b], x_1 = a, x_n+1 = b

I = 0; % Inicializamos la variable de salida

% Sumamos la contribución de cada subintervalo
for i = 1:n
    pm = (x(i) + x(i+1))/2; % Punto medio del subintervalo
    I = I + h*f(pm);
end

end