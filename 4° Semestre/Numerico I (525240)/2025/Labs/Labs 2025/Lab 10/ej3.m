n=input("ingrese n: ");
M=matriz_ejercicio0(n,2,-1,-1);
b=(2:2:2*n)';
issymmetric(M)
v=eig(M);
p=true;
for i=1 : size(v)
    if v(i)<=0
      p=false;
    end
end
if issymmetric(M) && p
    R=chol(M);  % Devuelve L^T
end
y=R'\b;
x=R\y;

M*x

