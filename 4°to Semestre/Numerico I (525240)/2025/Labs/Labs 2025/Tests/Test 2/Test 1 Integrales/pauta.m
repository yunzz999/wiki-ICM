% --- DATOS DEL PROBLEMA ---
c0 = -1;
t0 = 0;
tf = 2;
y0 = 1;

% Función h(t)
h_fun = @(t) -exp(t) .* sin(t);

% Solución exacta y valor real en t=2
sol_exacta = @(t) exp(t) .* cos(t);
val_exacto = sol_exacta(tf);

% --- DEFINICIÓN DEL INTEGRANDO ---
% Según la Ec. (1), y(2) = Término_Homogéneo + Integral(Integrando)
% El término homogéneo es constante fuera de la integral
termino_homogeneo = exp(-c0 * (tf - t0)) * y0;

% El integrando es función de 's' (variable de integración), con t fijo en tf
integrando = @(s) exp(-c0 * (tf - s)) .* h_fun(s);


% --- 1. PARTICIÓN Y NODO 37 (N = 50) ---
N_pm = 50;
h_pm = (tf - t0) / N_pm;
% Generamos el vector de nodos manualmente para identificar x_37
nodos_50 = t0 + h_pm * (0:N_pm); 
% En Matlab el índice 1 es x0, el índice 38 es x37
nodo_37 = nodos_50(38);


% --- 2. PUNTO MEDIO COMPUESTO (N = 50) ---
% Llamamos a tu función externa punto_medio
integral_PM = punto_medio(t0, tf, integrando, N_pm);

% Sumamos la parte homogénea para obtener y(2)
y2_PM = termino_homogeneo + integral_PM;


% --- 3. ERROR PUNTO MEDIO ---
error2_PM = abs(val_exacto - y2_PM);


% --- 4. REGLA DE SIMPSON (ENCONTRAR M) ---
M = 1; 
while true
    integral_S = simpson(t0, tf, integrando, M);
    y_approx_S = termino_homogeneo + integral_S;
    
    if abs(val_exacto - y_approx_S) < 10^-6
        break; % Se cumple la tolerancia, M actual es la respuesta
    end
    M = M + 1;
end


% --- 5. REGLA DEL TRAPECIO (N = 80) ---
N_t = 80;
integral_T = trapecio(t0, tf, integrando, N_t);

y2_T = termino_homogeneo + integral_T;
error2_T = abs(val_exacto - y2_T);


% --- 6. VALIDACIÓN DE NODO (1.7750) ---
% Reconstruimos la partición usada en Trapecio (N=80)
tt=linspace(0,2,N_t+1);
val_buscado = 1.7750;
% Verificamos con una pequeña tolerancia por errores de punto flotante
if ismember(val_buscado,tt)
    es_nodo=1;
else
    es_nodo=0;
end