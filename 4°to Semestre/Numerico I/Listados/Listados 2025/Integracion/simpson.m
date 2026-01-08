function aprox =simpson (a,b,n,f)
    h=linspace(a,b,2*n);
    aprox=0;
    for i=2:n
        aprox=aprox+f(h(2*i-2))+4*f(h(2*i-1))+f(h(2*i));
    end
    aprox=aprox*(2./6*(h(2)-h(1)));
end