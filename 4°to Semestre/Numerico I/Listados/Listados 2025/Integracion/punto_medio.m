function [aprox] = punto_medio(a,b,n,f)
    hs=linspace(a,b,n);
    aprox=0;
    for i=2:n
        aprox=aprox+f((hs(i)+hs(i-1))/2);
    end
    aprox=aprox*(hs(2)-hs(1));
end