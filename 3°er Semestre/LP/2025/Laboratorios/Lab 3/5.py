def perfecto(n):
    sum=0
    for i in range(1,n):
        if(n%i==0):
            sum+=i
            
    if(n==sum):
        return True
    else:
        return False


for i in range(10**7):
    if(perfecto(i)):
        print(i)
