function [aprox,iter] = newton2D(f1,f2,dxf1,dyf1,dxf2,dyf2,x0,tol,maxiter)

% Función que aproxima la solución del sistema de ecuaciones no 
% lineales F(X) = 0 por el Método de Newton partiendo desde el 
% vector X0 con un error menor que tol, y realizando un máximo maxit de 
% iteraciones. La función y sus derivadas deben ser ingresadas como 
% function_handle.

iter = 0;
dif = 2*tol;
while (dif >= tol) && (iter < maxiter)
    iter = iter + 1;
    x_ant = x0;
    Df_ant = [dxf1(x_ant(1),x_ant(2)) dyf1(x_ant(1),x_ant(2));dxf2(x_ant(1),x_ant(2)) dyf2(x_ant(1),x_ant(2))];
    if abs(det(Df_ant)) < 1e-15
        error('Matriz evaluada en x_k no invertible')
    end
    f_ant = [f1(x_ant(1),x_ant(2));f2(x_ant(1),x_ant(2))];
    delta = -Df_ant\f_ant;
    % [L,U,P] = lu(Df_ant);
    % yy = sustitucion_progresiva(L,P*(-f_ant));
    % delta = sustitucion_regresiva(U,yy);
    x_sig = delta + x_ant
    if norm([f1(x_sig(1),x_sig(2));f2(x_sig(1),x_sig(2))],2) < 1e-15
        aprox = x_sig;
        return
    else
        dif = norm(x_sig-x_ant,2);
        x0 = x_sig;
    end
end
aprox = x_sig;
end