function A = tridiag2(n,a,b,c,d)

A = zeros(n);
for i = 1:n
    A(i,i) = a;
end
for i = 2:n
    A(i-1,i) = b;
    A(i,i-1) = c;
end
A(n,3)=d;
A(n-1,2)=d;
A(n-2,1)=d;
A(1,n-2)=d;
A(2,n-1)=d;
A(3,n)=d;

end