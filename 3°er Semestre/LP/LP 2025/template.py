import numpy as np 

def leevalida(m,M,txt):
    x=int(input(txt))
    while(not m<= x <= M):
        x=int(input("Error, ingrese denuevo: "))
    return x

def creamat(n,m,nM):
    R=np.zeros((n,m),dtype=int)
    for i in range(n):
        for j in range(m):
            R[i,j]=int(input(f"{nM}[{i+1},{j+1}]="))
    return R

def matmul(A,B):
    n,p,m=len(A),len(A[0]),len(B)
    C=np.zeros((n,m),dtype=int)
    for i in range(n):
        for j in range(m):
            for k in range(p):
                C[i,j]+=A[i,k]*B[k,j]
    return C



import numpy as np

def leevalida(m,M,txt):
    x=int(input(txt))
    while(not m<= x <= M):
        x=int(input("Error, ingrese denuevo: "))
    return x

n=leevalida(10,19,"n: ")
A=np.zeros((n,n))
b=leevalida(1,float("inf"),"b: ")


def bomba(x,y,m):
    A[x][y]+=5
    l=[1,0,-1]
    for i in l:
        for j in l:
            if(i!=0 or j!=0):
                A[x+i][y+j]+=3
    return A

for i in range(b):
    x=leevalida(1,n-2,f"x{i+1}")
    y=leevalida(1,n-2,f"y{i+1}")
    A=bomba(x,y,A)

print()
print(A)


import numpy as np

def leer_matriz(filas, columnas):
    A = np.zeros((filas, columnas))
    for i in range(filas):
        fila = input().split()
        for j in range(columnas):
            A[i][j] = float(fila[j])
    return A

def rango_matriz(A):
    A = A.astype(float)  # Asegura decimales
    m, n = A.shape
    fila_actual = 0

    for col in range(n):
        # Buscar una fila con un elemento distinto de 0 en esta columna
        pivote = None
        for f in range(fila_actual, m):
            if A[f][col] != 0:
                pivote = f
                break

        if pivote is None:
            continue  # No hay pivote en esta columna, pasar a la siguiente

        # Intercambiar filas si es necesario
        if pivote != fila_actual:
            A[[fila_actual, pivote]] = A[[pivote, fila_actual]]

        # Normalizar la fila pivote
        A[fila_actual] = A[fila_actual] / A[fila_actual][col]

        # Eliminar todos los valores por debajo y encima del pivote
        for f in range(m):
            if f != fila_actual and A[f][col] != 0:
                A[f] = A[f] - A[f][col] * A[fila_actual]

        fila_actual += 1

    # Contar las filas no nulas
    rango = 0
    for i in range(m):
        if not np.allclose(A[i], 0):
            rango += 1
    return rango

# Entrada
m, n = map(int, input().split())
A = leer_matriz(m, n)

# Salida
print(rango_matriz(A))




