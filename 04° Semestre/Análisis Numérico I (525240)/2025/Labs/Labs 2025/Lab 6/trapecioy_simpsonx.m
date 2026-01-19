function I = trapecioy_simpsonx(f,a,b,c,d,N1,N2)
% Función para calcular la integral de una función de dos variables x e y,
% con x en [a,b], y en [c,d]. La integral con respecto a x se hace con
% Simpson compuesta en N2 subintervalos y la integral con respecto a y se
% hace con Trapecio compuesta en N1 subintervalos.

% Partición y tamaño de intervalo (sólo para x)
h2 = (b-a)/N2;
x = a:h2:b;

% Inicializamos la variable I de salida como cero, ya que acumularemos
% sumas sobre ella
I = 0;

% Ciclo sobre x
for i = 1:N2
    % Simpson utiliza extremos y punto medio de intervalos
    pm = (x(i)+x(i+1))/2;
    % Cada evaluación de función aquí es una integral con respecto a y que
    % haremos con trapecio en N1 subintervalos
    int_inf = trapecio(c,d,@(y)f(x(i),y),N1);
    int_pm = trapecio(c,d,@(y)f(pm,y),N1);
    int_sup = trapecio(c,d,@(y)f(x(i+1),y),N1);
    % actualizamos I
    I = I + (h2/6)*(int_inf + 4*int_pm + int_sup);
end
end