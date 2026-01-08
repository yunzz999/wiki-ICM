% Variables a evaluar
% diagdom
% sim
% L43
% U22
% y2
% x3
% R

b=[6,9,11,10]';
M=[4,1,1,0;1,5,2,1;1,2,6,2;0,1,2,7];
diagdom=1;
sim = 1;
[L,U,P]=lu(M);
L43=L(4,3);
U22=U(2,2);
y=sustitucion_progresiva(L,P*b);
x=sustitucion_regresiva(U,y);
y2=y(2);
x3=x(3);
R=norm(M*x-b);

