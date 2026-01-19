function prod= productointerior (x,y)
if length(x)~=length(y)
    error('deben tener la misma cantidad de componentes');
else
prod=0;
n=length(x);
for i=1 :n
    prod=prod+x(i)*y(i);
end
end

