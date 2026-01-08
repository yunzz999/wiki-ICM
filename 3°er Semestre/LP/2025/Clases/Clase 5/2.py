n=int(input("n: "))
k=8*n+1
if(int(k**(1/2))==k**(1/2)):
    print("yes")
    print(int((k**(1/2)-1))//2)
else:
    print("no")
