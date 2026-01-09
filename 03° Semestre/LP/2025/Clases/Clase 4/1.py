n=int(input("n:"))
res=1
for i in range(1,n+1):
    res=res*i
s=str(res)
cero=0
for i in range(len(s)):
    if(s[i]=='0'):
        cero+=1

print(cero,"y",len(s)-cero)