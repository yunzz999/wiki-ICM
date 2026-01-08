p1 = input('Ingrese los coeficientes: ');
ooo=roots(p1);
% Divisores 
l1 = double(divisors(sym(p1(end))));
l2 = double(divisors(sym(p1(1))));

% Prueba todas las combinaciones
sol = [];
for i = 1:length(l1)
    for j = 1:length(l2)
        p = l1(i);
        q = l2(j);
        if (polyval(p1,p/q)) == 0
            sol = [sol; p,   q];
        elseif polyval(p1,-p/q) == 0
            sol = [sol; -p,  q];
        end
    end
end


% Resultados
if ~isempty(sol)
    sol = unique(sol, 'rows');
    fprintf('Las raices racionales son:\n');
    for k = 1:size(sol,1)
        fprintf('%d/%d\n', sol(k,1), sol(k,2));
    end
else
    fprintf('El polinomio no posee soluciones racionales.\n');
    
end


