n=int(input())
v=input()


for i in range (n):
    l=[0]*10
    l1=[0]*len(v)
    for j in v:
        if not( int(j) in l1):
            l1.append(int(j))
            l[int(j)]=1        
        else:
            l[int(j)]+=1
    v=""
    for i in range(len(l1)):
        s=int(l1[i])
        if(l[s]>0):
            v+=str(l[s])+str(s)
    print(v)

