n=int(input())
v=input()


for i in range(n):
    r=""
    count=1
    for j in range(len(v)):
        if(j+1<len(v) and v[j]==v[j+1]):
            count+=1
        else:
            r+=str(count)+str(v[j])
            count=1
    if(r!=""):
        v=r 
    print(v)

