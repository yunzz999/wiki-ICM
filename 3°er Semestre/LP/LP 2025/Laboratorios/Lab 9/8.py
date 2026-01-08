import numpy as np 

def leevalida(m,M,txt):
    x=int(input(txt))
    while(not m<= x <= M):
        x=int(input("Error, ingrese denuevo: "))
    return x

def conjugar(A):
    c=True
    for i in range(n):
        for j in range(n):
            if(A[i][j].imag!=0):
                A[i][j]= A[i][j].conjugate
                c=False
            else:
                A[i][j]=int(A[i][j])


    return [A,c]



n=leevalida(1,float('inf'),"n: ")
m=np.zeros((n,n), dtype=complex)
for i in range(n):
    for j in range(n):
        m[i][j]=complex(input())

conj=conjugar(m)

print(m)
print(conj[0])

if m.all()==m.T.all() and m.all()==conj[0].all() and not conj[1]:
    print("H")

if(m.all()==m.T.all() and conj[1]):
    print("sim")
