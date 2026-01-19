function [aprox,iter] = biseccion(f,a,b,tol)

% Función que aproxima la solución de la ecuación no lineal f(x) = 0
% por medio del Método de la Bisección partiendo desde el intervalo
% [a,b] con un error menor que tol. La función debe ser ingresada como
% function_handle.


if f(a)*f(b) > 0
    error('Intervalo no adecuado para usar el Método de Bisección')
elseif f(a)*f(b) == 0
    error('La solución es x=a o x=b')
else
    iter = 0;
    longitud_intervalo = b-a;
    while iter <= log(tol/(longitud_intervalo))/log(0.5)
        iter = iter + 1;
        pm = (b+a)/2;
            if f(a)*f(pm) > 0
                a = pm;
            elseif f(a)*f(pm) == 0
                aprox = pm;
                return
            elseif f(a)*f(pm) < 0
                b = pm;
            end
    end
end
aprox = pm;

end