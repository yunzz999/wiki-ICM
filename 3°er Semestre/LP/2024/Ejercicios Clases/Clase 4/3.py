a = int(input())
b= int(input())

sum=0
while (a!=1):
    if(a%2!=0):
        sum+=b
    a=int(a/2)
    b=2*b

print(sum+b)


