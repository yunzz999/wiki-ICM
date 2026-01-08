m=int(input("m: "))
p=int(input("p: "))

sum=0
c=True
for i in range(m-1):
    s=str(i+1)
    x=int(input("ingrese carga "+s+" : "))
    sum+=x
    if(sum>p):
        print(sum-x)
        c=False
        break
if(c):
    print(sum)


