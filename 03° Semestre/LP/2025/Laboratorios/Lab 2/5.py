n=int(input("Numero de autos: "))
sum=0

while(n<1 or n>1000):
    print("Valor ingresado no en el rango.")
    n=int(input("Numero de autos: "))

for i in range(n):
    t=int(input("t: "))
    v=int(input("v: "))
    cobro=float(2*t*v) 
    sum+=cobro 
    if(v>14):
        sum+=100 #multa
        print("Longitud vehiculo",i+1,":",float(t*v),"+ multa: 100")
    else:
        print("Longitud vehiculo",i+1,":",float(t*v))
print()
print("Recaudacion Total: $",int(sum))


