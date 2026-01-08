function [aprox,iter] = secante(f,x0,x1,tol,maxit)

% Función que aproxima la solución de la ecuación no lineal f(x) = 0
% por medio del Método de la Secante partiendo desde los valores x0, x1
% con un error menor que tol, y realizando un máximo maxit de iteraciones. 
% La función debe ser ingresada como function_handle.

iter = 0;
dif = 2*tol;
while (dif >= tol) && (iter < maxit)
    iter = iter + 1;
    x_antant = x0;
    x_ant = x1;
    if abs(f(x_ant)-f(x_antant)) < 1e-15
        error('f(x_k)-f(x_(k-1)) igual a cero')
    end
    cuoc = (f(x_ant) - f(x_antant))/(x_ant - x_antant);
    x_sig = x_ant - f(x_ant)/cuoc;
    if abs(f(x_sig)) < 1e-12
        aprox = x_sig;
        return
    else
        dif = abs(x_sig-x_ant);
        x1 = x_sig;
        x0 = x_ant;
    end
end
aprox = x_sig;
end