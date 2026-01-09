function v = polyinterp(x,y,u)
% polyinterp(x,y,u) retorna los valores en las entradas
% u del polinomio de interpolacion que pasa por los
% puntos cuyas coordenadas son las entradas de x e y
% El polinomio fue calculado usando los polinomios de Lagrange
n = length(x)-1;
v = zeros(size(u));
for k = 0:n
    w = ones(size(u));
    for i = 0:n
        if i ~= k
            % En Matlab los indices comienzan en 1
            w = (u-x(i+1))./(x(k+1)-x(i+1)) .*w;
        end
    end
    v = v + w*y(k+1);
end
end
