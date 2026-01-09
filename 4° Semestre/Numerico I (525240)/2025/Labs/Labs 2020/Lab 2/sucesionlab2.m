function [v] = sucesionlab2(a,x0,n)
if (x0<0) || (x0>2/a) 
    error("x_0 esta fuera del intervalo");
else
    v(1)=x0;
    for i=2:n
        v(i)=v(i-1)*(2-a*v(i-1));
    end
end