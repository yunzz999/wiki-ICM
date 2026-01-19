n=int(input())
l=[]
for i in range(n):
    temp=input()
    l.append(temp)

s=[]
t=[]
for i in range(n):
    t=l[i].split(".")
    s.append(t[len(t)])