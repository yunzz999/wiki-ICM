% Definición del sistema
A = [9, 3, 3, 3; 3, 10, 4, 4; 3, 4, 12, 5; 3, 4, 5, 13];
b = [18; 21; 24; 25]; % Es mejor definirlo columna directamente o trasponer

% 1. Simetría
sim = double(issymmetric(A));

% 2. Definida positiva
vp = eig(A);
defpos = 1;
for i = 1:length(vp)
    if(vp(i) <= 0)
        defpos = 0; % ERROR CORREGIDO: Usar 0 en lugar de false para mantener consistencia numérica
        break;
    end
end

% 3. Factorización de Cholesky
if sim && defpos
    % chol(A) en Matlab devuelve la triangular SUPERIOR (L'), por eso la llamamos L_t
    L_t = chol(A); 
    L = L_t';      % Obtenemos la triangular inferior
    
    L43 = L(4,3);
    N = norm(L*L_t - A);
    
    % 4. Resolución del sistema
    % (i) Sustitución progresiva Ly = b
    y_completo = sustitucion_progresiva(L, b); 
    
    % ERROR CORREGIDO: El enunciado pide almacenar solo la PRIMERA componente en y1.
    % El código original guardaba todo el vector.
    y1 = y_completo(1); 
    
    % (ii) Sustitución regresiva L'x = y
    x_completo = sustitucion_regresiva(L_t, y_completo); 
    
    % ERROR CORREGIDO: El enunciado pide almacenar solo la SEGUNDA componente en x2.
    x2 = x_completo(2);
    
    % 5. Residuo
    % ERROR CORREGIDO: Para calcular el residuo necesitamos el vector solución completo (x_completo),
    % no el escalar x2.
    R = norm(A*x_completo - b);
    
    % Mostrar resultados
    disp('Resultados:');
    disp(['sim: ', num2str(sim)]);
    disp(['defpos: ', num2str(defpos)]);
    disp(['L43: ', num2str(L43)]);
    disp(['N: ', num2str(N)]);
    disp(['y1: ', num2str(y1)]);
    disp(['x2: ', num2str(x2)]);
    disp(['R: ', num2str(R)]);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% FUNCIONES A UTILIZAR %%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%% SUSTITUCIÓN PROGRESIVA %%%%%%%%%%%%%%%%%%
function x = sustitucion_progresiva(L, b)
    n = length(b);
    x = zeros(n, 1);
    
    % Validación de triangular inferior
    if norm(L - tril(L)) > 1e-6
        error('La matriz no es triangular inferior');
    end
    
    x(1) = b(1) / L(1,1);
    
    for i = 2:n
        suma = 0;
        for j = 1:i-1
            suma = suma + L(i,j) * x(j);
        end
        x(i) = (b(i) - suma) / L(i,i);
    end
end

%%%%%%%%%%%%%%%%%% SUSTITUCIÓN REGRESIVA %%%%%%%%%%%%%%%%%%
function x = sustitucion_regresiva(U, y)
    n = length(y);
    x = zeros(n, 1);
    
    % Validación de triangular superior
    if norm(U - triu(U)) > 1e-6
        error('La matriz no es triangular superior');
    end
    
    x(n) = y(n) / U(n,n);
    
    for i = 1:n-1
        % Calculamos el índice de la fila actual (yendo hacia atrás)
        k = n - i; 
        
        suma = 0;
        
        % ERROR CORREGIDO: Lógica del bucle interno.
        % En el código original: for j = length(y)-i : length(y)
        % Eso equivalía a j = k : n. ESTO INCLUÍA LA DIAGONAL (j=k) en la suma.
        % La diagonal no debe sumarse, ya que es el valor por el que dividimos al final.
        % El rango correcto es desde k+1 hasta n.
        
        for j = k+1 : n
            suma = suma + U(k,j) * x(j);
        end
        
        x(k) = (y(k) - suma) / U(k,k);
    end
end