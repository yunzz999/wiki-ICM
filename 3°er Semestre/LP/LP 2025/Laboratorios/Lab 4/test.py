def capicua(n):
    l=len(n)-1
    for i in range (l+1):
        if(n[i]!=n[l-i]):
            return True;

    return False

n=input()
while(capicua(n)):
    inv=n[::- 1]
    n=str(int(n)+int(inv))
print(n)