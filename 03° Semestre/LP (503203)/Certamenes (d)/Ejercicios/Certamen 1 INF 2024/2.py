def factorial(n):
    if n==1 or n==0:
        return 1
    else:
        return n*factorial(n-1)


def SerieTaylor(x,n):
    suma=0
    for i in range(n):
        suma+=(x**i)/factorial(i)
    return suma

def main():
    numero=float(input())
    print(SerieTaylor(numero,50))

main()
