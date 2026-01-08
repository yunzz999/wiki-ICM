% Variables a evaluar
% nodo_37
% y2_PM
% error2_PM
% M_S
% y2_T
% error2_T
% es_nodo

sol = @(t) exp(t).*cos(t);
aprox2 = @(s) exp((2-s)) .* (-exp(s).*sin(s));

%% Ítem 1: nodo 37 en 50 subintervalos
xx = linspace(0,2,51);   % 50 subintervalos -> 51 nodos
nodo_37 = xx(38);        % x_37 (considerando índice MATLAB)

%% Ítem 2: Punto medio compuesto
N = 50;
I_PM = punto_medio(0,2,aprox2,N);
y2_PM = exp(2)*1 + I_PM;
error2_PM = abs(sol(2) - y2_PM);

%% Ítem 4: Simpson compuesto hasta error < 1e-6
tol = 1e-6;
for M = 2:2:200000
    I_S = simpson(0,2,aprox2,M);
    y_tmp = exp(2)*1 + I_S;
    if abs(y_tmp - sol(2)) < tol
        M_S = M;
        break
    end
end

%% Ítem 5: Trapecio compuesto con N = 80
M = 80;
I_T = trapecio(0,2,aprox2,M);
y2_T = exp(2)*1 + I_T;
error2_T = abs(sol(2) - y2_T);

tt = linspace(0,2,M+1);

es_nodo = ismember(1.7750, tt);


disp(M_s)