modulo=input("ingresa el modulo: ");
n=input("hasta que potencia quieres mirar: ");

f=@(t) mod(t.^(1:n),modulo);

t=ones(1,n);
A=zeros(modulo,n);

puntos=ones(1,(modulo-1))

A(1,:)=["*",(2:1:n)];
for i=2:(modulo)
   A(i,:)=f((i-1).*t);
   for j=1:n
        if A(i,j)==1
            puntos(i-1)=j;
            break
        end
   end
end

q=(1:1:modulo-1);

size(q)
size(puntos)


p=polyfit(q,puntos,modulo-1);
plot(q,polyval(p,q),"b")
hold on
plot(q,puntos,"r*")
grid on
hold on
legend("donde se hacen 1")


