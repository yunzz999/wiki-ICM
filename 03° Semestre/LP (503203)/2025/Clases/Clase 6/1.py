def divisors(n):
    sum=0
    for i in range(1,n):
        if(n%i==0):
            sum+=i
    return sum

def main():
    n=int(input("n: "))
    while(n<0):
        n=int(input("n debe ser mayor a 0, ingrese denuevo: "))
    x=divisors(n)
    if(divisors(x)==n and x!=n):
        print(x)
    else:
        print(n,"no tiene amigo")
main()