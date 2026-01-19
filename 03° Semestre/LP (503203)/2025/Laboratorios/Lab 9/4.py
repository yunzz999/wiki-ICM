import numpy as np 

def leevalida(m,M,txt):
    x=int(input(txt))
    while(not m<= x <= M):
        x=int(input("Error, ingrese denuevo: "))
    return x

def creamat(n):
    A=np.zeros((n,n))
    for i in range(n):
        for j in range(n):
            A[i][j]=float(input(f"A[{i}][{j}]="))
    return A

n=leevalida(2,10,"n: ")
A=creamat(n)
B=creamat(n)


for i in range(n):
    for j in range(n):
        