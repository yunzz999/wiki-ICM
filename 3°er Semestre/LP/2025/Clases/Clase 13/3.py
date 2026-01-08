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

def valid_sub(x,y,m):
    l=[]
    for i in range(x,x+3):
        for j in range(y,y+3):
            if(m[i][j] in l):
                return False
            else:
                l.append(m[i][j])
    return True

def sub(m):
    c=True
    for i in range(3):
        for j in range(3):
            if(not valid_sub(i*3,j*3,m)):
                return False
    return True

def fila(m):
    for i in range(9):
        l=[]
        for j in m[i,:]:
            if j in l:
                return False
            else:
                l.append(j)
    return True

def columna(m):
    for i in range(9):
        l=[]
        for j in m[:,i]:
            if j in l:
                return False
            else:
                l.append(j)
    return True


m=creamat(9,9,"S")

if(columna(m) and fila(m) and sub(m)):
    print("correcto")
else:
    print("incorrecto")