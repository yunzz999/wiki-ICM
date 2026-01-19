function[pvt] = pivote(A,b,posicioncol)
pvt = 0;
h = [];
H = zeros(1,length(b));
H = A(:,posicioncol);
for i = 1:length(b)
    if b(i) < 0
        h(i) = inf;
    else 
        h(i) = H(i)/b(i);
    end
pvt = min(h);    
end