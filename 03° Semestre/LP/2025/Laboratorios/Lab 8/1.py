def leevalida(m,M,txt):
    x=int(input(txt))
    while(not m<= x <= M):
        x=int(input("Error, ingrese denuevo: "))
    return x


n=leevalida(6,100,"n: ")
l=[]
mini=float('inf')
maxi=-float('inf')
for i in range(n):
    x=int(input())
    l.append(x)
    if(x<mini):
        mini=x
    if(x>maxi):
        maxi=x 
p=leevalida(mini,maxi,"p: ")
s=[]
for j in l:
    if(j>p and j%2!=0):
        s.append(j)
print(s)
