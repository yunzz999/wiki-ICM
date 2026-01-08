def conw(s):
    sol=""
    i=0
    while(i<len(s)):
        sum=1
        temp=s[i]
        j=i
        while(j+1<len(s) and s[j+1]==temp):
            sum+=1
            j+=1
        sol+=str(sum)+s[i]   
        i=j+1
    return sol   

def main():
    n=int(input("cantidad pasos: "))
    v=input("valor inicial: ")
    print(v)
    for i in range(1,n):
        v=conw(v)
        print(v)
main()