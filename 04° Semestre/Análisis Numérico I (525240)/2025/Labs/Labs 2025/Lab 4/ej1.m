x=[-2,-1,0,1,2];
y=[-25,-4,-1,8,47];

z=-2:4/1000:2;
k=polyinterp(x,y,z);

p=polyfit(x,y,4);
o2=polyval(p,z);

plot(z,k,"r-")
hold on
plot(z,o2,"b--")

%7 Como la cantidad de puntos es 5 y el grado del polinomio es 4, existe un
%unico polinomio que interpola.?