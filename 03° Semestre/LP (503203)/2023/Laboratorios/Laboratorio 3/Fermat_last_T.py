a=int(input())
b=int(input())
c=int(input())

sum=0
for i in range(1,a+1):
    for j in range(1,b+1):
        for k in range(1,c+1):
            if(i**2+j**2==k**2):
                print("x=",i,",y=",j,",z=",k)
                sum+=1
print(sum)