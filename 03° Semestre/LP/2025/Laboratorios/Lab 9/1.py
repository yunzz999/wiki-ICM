import numpy as np 


def creavec(n):
    A=np.zeros(n)
    for i in range(n):
        A[i]=float(input(f"A[{i}]="))
    return A

V=creavec(12)
for i in range(len(V)):
    print(V[len(V)-i-1],end=" ")


#np.empty(n) matriz vaca dim N
#np.zeros(n) matriz nula dim N
#np.ones(n)...
#np.full(dim,valor)
#np.identity
#np.arange(inicio,fin,salto) sucesion aritmetica
#np.linspace(inicio,fin,n)
#np.random.random(dim)
#a.ndim  dimensiones 
#a.shape tupla con dimensiones
#a.size  numero elem
#a.dtype tipo elem
#a[condicion]
#a.dot(b) Producto matricial
#a.T transpuesta