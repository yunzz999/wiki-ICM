def leevalida(m,M,txt):
    x=int(input(txt))
    while(not m<= x <= M):
        x=int(input("Error, ingrese denuevo: "))
    return x


def distancia(l1,l2):
    sum=0
    for i in range(3):
        sum+=(l1[i]-l2[i])**2
    return sum**0.5


def tbateria(b,m):
    return b-(m/50)


def mindis(j,l):
    min=float('inf')
    for i in range(j):
        d=distancia(l[i],l[j])
        if(d<min):
            min=d
            sol=d+distancia(l[i],l[0])
    return sol



bateria=leevalida(1,100,"bateria: ")


m=[]
while(True):
    x=int(input("x: "))
    y=int(input("y: "))
    z=int(input("z: "))
    if(x!=0 or y!=0 or z!=0):
        m.append([x,y,z])
    else:
        break

b=bateria
a=True
for i in range(1,len(m)):
    d=distancia(m[i-1],m[i])
    if(tbateria(b,d)>=bateria/2):
        b=tbateria(b,d)
    else:
        k=mindis(i,m) 
        sol=max(2*b-bateria,tbateria(b,k))
        a=False

if(a):
    k=mindis(len(m)-1,m)
    sol=max(2*b-bateria,tbateria(b,k))
print(sol)


