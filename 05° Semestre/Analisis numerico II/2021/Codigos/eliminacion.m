function x = eliminacion(A,B)
n = length(A(1,:));
A=[A';B']';
x=zeros(n,1);
for p=1:n
    for k=[1:p-1,p+1:n]
    m=-A(k,p)/A(p,p);
    A(k,:) = A(k,:)+m*A(p,:);
end
end
x = A(:,n+1)./diag(A);
end