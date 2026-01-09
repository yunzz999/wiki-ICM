n=int(input("n: "))
m=int(input("m: "))
sum=0
while(n>=1):
    if(n%2!=0):
        sum+=m 
    m=2*m 
    n=n//2
print(sum)