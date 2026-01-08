function [vec] = sucesionlab22(a,x0,n)
    if (x0<0)||(a<0)
        error("error en los datos")
    else
        vec(1)=x0;
        for i=2:n
            vec(i)=1/2*(vec(i-1)+(a/vec(i-1)));
        end
        
end