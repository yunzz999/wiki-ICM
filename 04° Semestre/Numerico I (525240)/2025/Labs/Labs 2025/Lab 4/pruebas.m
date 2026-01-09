m=input("Ingrese cantidad de puntos: ");
x=zeros(m,1);
y=zeros(m,1);
for i=1:m
    x(i)=input("Cordenada x: ");
    y(i)=input("Cordenada y: ");

end

v=polyfit(x,y,m-1);
polyval(v,5);
