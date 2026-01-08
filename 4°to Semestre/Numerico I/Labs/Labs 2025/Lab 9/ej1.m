n=input("Ingrese n: ");
M=tridiag(n,4,-1,-1);
b=1:1:n;
b(n)=1;
bt=b';
x1=A\b;
x2=regla_de_cramer(A,b);

% A medida que aumenta N gauss es mucho mas eficiente.