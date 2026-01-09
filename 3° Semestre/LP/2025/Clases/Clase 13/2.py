import numpy as np 

n=int(input("n: "))
h=np.zeros((n,n))
for i in range(n):
    for j in range(n):
        h[i][j]=round(1/(i+j+1),2)

print(h)
