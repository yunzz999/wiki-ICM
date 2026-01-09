function[maxc,posicioncol] = maxcr(costorelativo)
Z = [];
p = [];
posicioncol = 0;
for i = 1:length(costorelativo)
    if costorelativo(i) > 0
        Z(i) = costorelativo(i);
    else 
        Z(i) = 0;
    end
end
maxc = max(Z);
for j = 1:length(costorelativo)
    if Z(j) == maxc
        Z(j) = maxc;
    else
        Z(j) = 0;
    end
end    
p = Z;
posicioncol = find(Z,maxc,'last');% columna del pivote
end

