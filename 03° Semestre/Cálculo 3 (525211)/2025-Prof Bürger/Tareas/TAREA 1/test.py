
def f (a,b,c):
    if(c>0):
        return f(b,(a+b)/2,c-1)
    else:
        print(b)

a=float(input("a: "))
b=float(input("b: "))
c=int(input("c: "))
f(a,b,c)