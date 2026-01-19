function aprox = trapecios(a,b,n,f)
    aprox=0;
    h=linspace(a,b,n);
    for i=2:n
        aprox=aprox+f(h(i))+f(h(i-1));
    end
    aprox=aprox*(h(2)-h(1))*0.5;
end