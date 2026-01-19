import numpy as np 

def creavec(n):
    A=np.zeros(n)
    for i in range(n):
        A[i]=float(input(f"A[{i}]="))
    return A


V=creavec(16)
sum1=0
for i in range(8):
    sum1+=V[i]
sum2=0
for i in range(8,16):
    sum2+=V[i]

print(sum1,sum2)