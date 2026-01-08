def solve(n):
    if(n%2==0):
        print(n,"es par")
        return
    elif(n%5==0):
        print(n,"es multiplo de 5")
        return

    s="1"
    while(True):
        if(int(s)%n==0):
            print(int(s)//n,"-",s)
            break
        else:
            s+="1"

m=int(input())
for i in range(m):
    n=int(input())
    solve(n)


