function raices_racionales_matlab()
    % Función optimizada que utiliza características nativas de MATLAB
    % para encontrar raíces racionales de un polinomio
    
    % Pedir coeficientes del polinomio (formato MATLAB: [a_n, a_{n-1}, ..., a_0])
    coef = input('Ingrese los coeficientes del polinomio (orden descendente de potencias): ');
    
    % Obtener divisores del término constante (a_0) y coeficiente principal (a_n)
    term_const = coef(end);
    coef_principal = coef(1);
    
    divisores_const = obtener_divisores(term_const);
    divisores_principal = obtener_divisores(coef_principal);
    
    % Generar todas las combinaciones p/q posibles (y -p/q)
    [P, Q] = meshgrid(divisores_const, divisores_principal);
    candidatos = [P(:)./Q(:); -P(:)./Q(:)];
    
    % Encontrar raíces exactas usando lógica vectorizada
    raices = [];
    for x = unique(candidatos)'
        if abs(polyval(coef, x)) < 1e-10  % Tolerancia numérica
            raices = [raices; x];
        end
    end
    
    % Mostrar resultados en formato fracción
    if ~isempty(raices)
        disp('Raíces racionales encontradas (en formato fracción):');
        for r = unique(raices)'
            [num, den] = rat(r);
            fprintf('%d/%d\n', num, den);
        end
    else
        disp('No se encontraron raíces racionales.');
    end
end

function divisores = obtener_divisores(n)
    % Función vectorizada para obtener divisores positivos de |n|
    n = abs(n);
    if n == 0
        divisores = 0;
        return;
    end
    factores = factor(n);
    combinaciones = unique(nchoosek([factores, 1], length(factores)), 'rows'); % Incluir 1
    divisores = unique(prod(combinaciones, 2))';
end