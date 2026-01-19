import numpy as np 
import time
import os

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')


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

def next_state(i,j,A,n):
    state=A[i][j]
    sum=0
    l=[-1,0,1]
    for k in l:
        for s in l:
            if(valid(i+k,n) and valid(j+s,n) and (k!=0 or s!=0)):
                sum+=A[i][j]

    if state==1:
        if sum<2 or sum>2:
            return 0
        else:
            return 1

    else:
        if sum==3 or sum==2:
            return 1
        else:
            return 0

n=leevalida(3,10,"n: ")
JV=np.zeros((n,n))
for i in range(n):
    for j in range(n):
        x=leevalida(0,1,f"JV[{i+1}][{j+1}]=")
        JV[i][j]=x

print(JV)
while(True):
    for i in range(n):
        for j in range(n):
            JV[i][j]=next_state(i,j,JV,n)
    print(JV)
    break