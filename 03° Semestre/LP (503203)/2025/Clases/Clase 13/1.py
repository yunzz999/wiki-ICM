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



n=int(input("n: "))
a=float(input("a: "))
b=float(input("b: "))
c=float(input("c: "))

nul=np.zeros((n,n))
for i in range(n):
    for j in range(n):
        if(i==j):
            nul[i][j]=a
        if(i+1==j):
            nul[i][j]=b
        if(j+1==i):
            nul[i][j]=c 

print(nul)