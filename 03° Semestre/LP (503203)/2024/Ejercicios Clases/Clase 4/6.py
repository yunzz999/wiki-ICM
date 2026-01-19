n=int(input())
d=int(input())

max_n=max(n,d)

mcd=1
for i in range(1,max_n+1):
    if(n%i==0 and d%i==0 and i>mcd):
        mcd=i 

if(mcd!=1):
    print(int(n/mcd),int(d/mcd))
else:
    print("Fraccion Irreductible")
