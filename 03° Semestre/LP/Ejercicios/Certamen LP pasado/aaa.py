
def F(c):
    suma = 0 
    for i in range(c):
        print(suma,i)
        if suma == c:
            return i-1
        elif suma>c:
            return i-2
        else:
            suma+=i
def main():
    c=int(input())
    filas=F(c)
    resto=c-((filas*(filas+1))/2)
    print(filas,int(resto))

main()