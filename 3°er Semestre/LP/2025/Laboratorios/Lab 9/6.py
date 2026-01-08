import numpy as np 

def leevalida(m,M,txt):
    x=int(input(txt))
    while(not m<= x <= M):
        x=int(input("Error, ingrese denuevo: "))
    return x

def valid(j,n):
    if(0<=j<=n-1):
        return True
    else:
        return False


def nueva_m(x,y,m,n):
    m[x][y]+=1
    l=[1,-1]
    for i in l:
        if(valid(x+i,n)):
            m[x+i][y]+=1
        if(valid(y+i,n)):
            m[x][y+i]+=1

    return m

n=leevalida(1,float('inf'),"n: ")
b=leevalida(1,float('inf'),"bombas: ")
m=np.zeros((n,n))

for i in range(b):
    x=leevalida(1,n,f"x{i+1}=")
    y=leevalida(1,n,f"y{i+1}=")
    m=nueva_m(x-1,y-1,m,n)

print(m)