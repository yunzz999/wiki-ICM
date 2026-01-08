import math
def numeros_triangulares(c):
    r=(1+math.sqrt(1+8*c))/2
    if int(r)-r==0:
        return r-1
    else:
        return 0

def t_mayor(c):
    sum=0
    contador=0
    for i in range(c):
        sum+=i
        if sum>c:
            return contador-1
        contador+=1
def main():
    c=int(input())
    nt=numeros_triangulares(c)
    if nt ==0:
        tm=t_mayor(c)
        print("No apilables.Las",c,"latas se pueden apilar en",tm,"filas, pero sobran",c-int(tm*(tm+1)/2),"latas.")
    else:
        print("Las",c,"latas se pueden apilar en",int(nt),"filas")

main()

