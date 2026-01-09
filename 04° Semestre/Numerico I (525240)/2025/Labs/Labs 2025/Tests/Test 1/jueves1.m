





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% FUNCIONES A UTILIZAR %%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
% Variables a evaluar
% prod =
% c_B =
% iter_B =
% gcB =
% c_NR =
% iter_NR =
% gcNR =

g=@(x) 1./2.*exp(x.^2)-1./2-x;

prod=g(0.5).*g(1.5)
[c_B,iter_B]=biseccion(g,0.5,1.5,10.^(-3))
gcB=g(c_B)
dg=@(x) x.*exp(x.^2)-1;
[c_NR,iter_NR]=newton_raphson(g,dg,c_B,10.^(-9),100)
gcNR=g(c_NR)

xx=linspace(0.5,1.5,100);
plot(xx,g(xx),"b")
grid on
hold on
plot(c_B,gcB,"r*")
hold on
plot(c_NR,gcNR,"gd")
