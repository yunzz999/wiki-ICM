function [xr,fx,k]=biseccion(f,a,b,tol,kmax)
    fa=f(a);fb=f(b);
    if fa*fb>0
        error("El intervalo no cumple la hipotesis")
    end
    for k=1:kmax
        xr=(a+b)/2;
        fx=f(xr);

        if abs(fx)<=tol || (b-a)/2 <=tol
            return;
        end

        if fa*fx<0
            b=xr;
            fb=fx;
        else
            a=xr;
            fa=fx;
        end
    end
    xr=(a+b)/2;
    fx=f(xr);
end