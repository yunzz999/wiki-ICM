t=int(input())
for i in range(t):
    n=int(input())
    suma=0
    for i in range (1,n):
        if(n%i==0):
            suma+=i 
        
    if(suma==n):
        print(str(n)+"  es un numero perfecto")
    else:
        print(str(n)+" no es un numero perfecto")
