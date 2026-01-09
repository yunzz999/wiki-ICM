def tarifa (n):
    if (n<4):
        return 0
    elif (4<=n<=18):
        return 5000
    elif(18<n<65):
        return 10000
    elif(n>65):
        return 3000
    

def main():
    n=int(input())
    sum=0
    for i in range(n):
        t=int(input())
        sum+=tarifa(t)
    print(sum)

main()