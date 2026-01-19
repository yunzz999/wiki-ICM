def lagrange_pol(n,l,i,x):
    poli=1
    for j in range (n):
        if(j!=i):
            poli*= (x-l[j][0])/(l[i][0]-l[j][0])
    return poli


def pol(x,l,n):
    res=0
    for i in range(n):
        res+=l[i][1]*lagrange_pol(n,l,i,x)
    return res



n=int(input("ingrese n puntos: "))
l=[]
for i in range(n):
    x=int(input("ingrese x:"))
    y=int(input("ingrese y:"))
    l.append([x,y])

x=float(input("ingrese el valor quee desea calcular de f: "))
print(pol(x,l,n))