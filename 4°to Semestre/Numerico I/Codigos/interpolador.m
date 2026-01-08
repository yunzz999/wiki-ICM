function inter =interpolador(lx,ly)
    syms x;
    inter=sym(0);
    for k=1:numel(lx)
        eval=ly(k);
        poli=lagrangepoli(k,lx);
        inter=inter+eval*poli;
    end
end

