n=int(input("n: "))
sum=0
while(True): #bucle infinito
    if(n<10):
        sum+=n%10 #mod 10
        break #corta el bucle
    sum+=n%10
    n=n//10 #division entera (aproximacion hacia abajo)
print(sum)