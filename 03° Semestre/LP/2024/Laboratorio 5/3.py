from math import sqrt

def distancia(x1,y1,x2,y2):
    r1=(x1-x2)**2
    r2=(y1-y2)**2
    return round(sqrt(r1+r2),1)

n=int(input())
lx=[]
ly=[]
for i in range(n):
    t=input()
    t=t.split()
    lx.append(float(t[0]))
    ly.append(float(t[1]))

sum=distancia(lx[0],ly[0],lx[n-1],ly[n-1]) 
# toma la distancia del primer al ultimo


for i in range(n):
    if(i+1<n):
        sum+=distancia(lx[i],ly[i],lx[i+1],ly[i+1]) #toma las distancias de los consecutivos

print(sum)
