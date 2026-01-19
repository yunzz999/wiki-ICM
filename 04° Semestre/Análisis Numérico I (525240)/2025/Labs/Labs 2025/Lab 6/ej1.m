f=@(x) x.^2;
g=@(x) exp(-x.^2);
h=@(x) log2(x);
j=@(x) sqrt(x);

integral(j,0,1)
trapecios(j,0,1,100)
