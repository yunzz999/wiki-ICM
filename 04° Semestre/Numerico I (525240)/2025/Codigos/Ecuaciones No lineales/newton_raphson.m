function [aprox,iter] = newton_raphson(f,df,x0,tol,maxit)

% Función que aproxima la solución de la ecuación no lineal f(x) = 0
% por medio del Método de Newton-Raphson partiendo desde el valor x0
% con un error menor que tol, y realizando un máximo maxit de iteraciones. 
% La función y su derivada deben ser ingresadas como function_handle.

iter = 0;
dif = 2*tol;
while (dif >= tol) && (iter < maxit)
    iter = iter + 1;
    x_ant = x0;
    if abs(df(x_ant)) < 1e-15
        error('Derivada en x_k igual a cero')
    end
    x_sig = x_ant - f(x_ant)/df(x_ant);
    if abs(f(x_sig)) < 1e-12
        aprox = x_sig;
        return
    else
        dif = abs(x_sig-x_ant);
        x0 = x_sig;
    end
end
aprox = x_sig;
end