def fiborial (n):
    if(n==0 or n==1):
        return 1
    else:
        return n*fiborial(n-1)*fiborial(n-2)

def divisors (n):
    div=0
    for i in range(1,n):
        if(n%i==0):
            div+=1
    return div+1


def main():
    n=int(input())
    r=fiborial(n)
    print(r)
    print(divisors(r))
main()
