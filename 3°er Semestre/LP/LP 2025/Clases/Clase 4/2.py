n=int(input("n:"))
k=int(input("k: "))

while(k>0):
    if(n%10==0):
        n=n//10
    else:
        n=n-1
    k=k-1

print(n)


