def tarifa(x):
    if(x<4):
        return 0
    if(4<=x<=18):
        return 5000
    if(18<=x<65):
        return 10000
    if(65<=x):
        return 3000


n=int(input("n: "))
sum=0
for i in range(n):
    s=str(i+1)
    x=int(input("edad "+s+" : "))
    sum+=tarifa(x)
print("$",sum)