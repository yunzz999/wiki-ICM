def perfecto(n):
    sum=0
    for i in range(1,n):
        if(n%i==0):
            sum+=i
            
    if(n==sum):
        return True
    else:
        return False

n=int(input("n: "))
for i in range(n):
    x=int(input())
    if(perfecto(x)):
        print(x,"es un numero perfecto")
    else:
        print(x,"no es un numero perfecto")
