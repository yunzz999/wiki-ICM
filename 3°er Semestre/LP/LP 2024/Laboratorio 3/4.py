def perfect_number(n):
    sum=0
    for i in range(1,n):
        if (sum>n):
            return False
        if(n%i==0):
            sum+=i

    if(sum==n):
        return True
    else:
        return False


def main():
    t=int(input())
    for i in range (t):
        n=int(input())
        if(perfect_number(n)):
            print(str(n)+" es un numero perfecto")
        else:
            print(str(n)+" no es un numero perfecto")

main()


