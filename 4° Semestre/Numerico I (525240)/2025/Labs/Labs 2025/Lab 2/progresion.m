function [sn]=progresion(n)
v=zeros(n,1);
v(1)=1;
for i=2:n
    v(i)=3*v(i-1);
end
sn=v(n);
end