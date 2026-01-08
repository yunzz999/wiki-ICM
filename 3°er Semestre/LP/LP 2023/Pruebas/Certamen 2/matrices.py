import numpy as np

def validacion(f,c):
    b=True
    if 5>f or f>100:
        b=False
    if 5>c or c>100:
        b=False
    return b

def sol(matriz,n,m):
    sol=[] ## almacena la solucion
    for i in range(n):
        for j in range(m):
            if matriz[i][j]!=0:
                sol.append([i,j,matriz[i][j]])
    sol2=np.array(sol)
    return sol2


def main():
    ## Input
    f=int(input())
    c=int(input())
    while(validacion(f,c)==False):
        print("Datos fuera de rango intente nuevamente: ")
        f=int(input())
        c=int(input())
    matriz=np.zeros((f,c))
    for i in range(f):
        for j in range(c):
           matriz[i][j]=int(input())
    print(sol(matriz,f,c))

main()