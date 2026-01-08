n=int(input("N: "))
m=int(input("M: "))
x=min(n,m)
s=1
for i in range(2,x+1):
    if(n%i==0 and m%i ==0):
        s=i

# BUSCA MCD (POCO OPTIMO).

if(s==1):
    print("Fraccion Irreductible")
else:
    print(n//s,m//s)
