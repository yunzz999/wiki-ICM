n=int(input())

f=1
for i in range(1,n+1):
    f=f*i

f=str(f)
sum=0
for i in f:
    if(i=="0"):
        sum+=1

print(f,sum,len(f)-sum)

###
def multiplicacion (x,y):
    sum=0
    for i in range(x):
        sum+=y
    
    return sum



