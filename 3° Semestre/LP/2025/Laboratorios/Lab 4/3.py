k=int(input("k: "))
n=int(input("n: "))

sol=0
for i in range(n):
    a=int(input("a: "))
    if((a+sol)-k<=0):
        sol=0
    else:
        sol=(a+sol)-k

print(sol)