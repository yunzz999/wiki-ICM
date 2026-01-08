function [x,k]=bisect(fun,a,b)
epsil=1.e-10;
k=0;
while b-a>epsil
    x=(a+b)/2;
    if fun(x)*fun(a)<0
        b=x;
    else
        a=x;
    end
    k=k+1;
end