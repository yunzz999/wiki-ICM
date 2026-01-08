def distancia(x1,x2,y1,y2):
    r=(x1-x2)*(x1-x2)
    s=(y1-y2)*(y1-y2)
    return (r+s)**0.5

n=int(input("n: "))
#lista para coordenadas x lx
#lista para coordenadas y ly
lx=[]
ly=[]
for i in range(n):
    x=float(input())
    lx.append(x)
    y=float(input())
    ly.append(y)
sum=0
for i in range(1,n):
    sum+=distancia(lx[i],lx[i-1],ly[i],ly[i-1])

sum+=distancia(lx[n-1],lx[0],ly[n-1],ly[0])

print(sum)
