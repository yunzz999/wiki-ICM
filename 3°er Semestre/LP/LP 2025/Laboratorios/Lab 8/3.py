def leevalida(m,M,txt):
    x=int(input(txt))
    while(not m<= x <= M):
        x=int(input("Error, ingrese denuevo: "))
    return x

l=[]
n=leevalida(1,20,"n: ")
for i in range(n):
    s=input()
    l.append(s)

w=""
for i in range(3):
    for j in range(n):
        w+=l[j][i]
print(w)