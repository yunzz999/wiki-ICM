def verificador1(n):
    pass
def verificador2(n):
    pass


t=int(input("t: "))
s=int(input("s: "))
x=0
r=0
while(True):
    x=int(input("f: "))
    if(x==-1):
        break
    print(((s*x)+r)//t)
    r=((s*x)+r)%t
print(r)
