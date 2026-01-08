import numpy as np 

def leevalida(m,M,txt):
    x=int(input(txt))
    while(not m<= x <= M):
        x=int(input("Error, ingrese denuevo: "))
    return x


ventas=np.zeros((5,4))
precios=np.zeros(5)

for i in range(5):
    precios[i]=int(input())


for i in range(5):
    for j in range(4):
        ventas[i][j]=int(input())

print(precios)
print(ventas)


print(int(np.sum(ventas[:,1])))
print(int(np.sum(ventas[:,2])))
print(int(ventas[2][0]))
t=precios.dot(ventas)
print(int(np.sum(t[3])))
print(int(np.sum(t)))


