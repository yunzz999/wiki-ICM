import math

def funcion(x):
    return math.cos(x)+math.sin(x)

def sumatoria(n,xi,xf):
    delta=(xf-xi)/n
    sum=0
    for i in range(n):
        xj=xi+delta*i
        sum+=delta*funcion(xj)
    return sum



def main():
    n=int(input("n: "))
    xi=int(input("xi: "))
    xf=int(input("xf: "))
    print("el valor de la integral es",sumatoria(n,xi,xf))

main()