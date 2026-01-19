y=@(x) cos(x)+x;
z1p=@(x,z1,z2) -z2 +x;
z2p=@(x,z1,z2) z1;

z10 =1;
z20 =1;

a=0;
b=10;

N=100;

[pare,z1se,z2se]=euler_explicito_2orden(a,b,z1p,z2p,z10,z20,N);

[pari,z1si,z2si]=euler_implicito_2orden(a,b,z1p,z2p,z10,z20,N);

plot(pare,y(pare),"m--")
hold on
plot(pare,z2se,"b-")
hold on
plot(pari,z2si,"g--")
grid on
legend("solucion exacta","euler explicito","euler implicito")