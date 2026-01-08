function li = lagrangepoli(i,l)
    syms x;
    li=sym(1);
    for k=1:numel(l)
        if k~=i
            li=li * (x - l(k)) / (l(i) - l(k));
        end
    end
end


