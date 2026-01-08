def capicua(n):
    l=len(n)-1
    for i in range (l+1):
        if(n[i]!=n[l-i]):
            print(n,"no es capicua")
            return;

    print(n,"es capicua") 


n=input()
capicua(n)




