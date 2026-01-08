M=matriz_ejercicio0(10,4,3,3);
b=ones(10,1);
[L,U,P]=lu(M);
P
y=L\b;
x=U\y; %buen resultado.

M1=matriz_ejercicio0(10,4,1,1);
[L1,U1,P1]=lu(M1); % L,U,P
P1
y1=L1\b;
x1=U1\y1;