while(True):
    n=int(input())
    if(1<n<=1000):
        l=[0]*n
        for i in range(n):
            l[i]=int(input())
            while(0>l[i] or l[i]>100):
                print("Error. ingrese nuevamente: ")
                l[i]=int(input())
        min=1000
        for i in range(n):
            if(l[i]<min):
                min=l[i]
        sum=0
        for i in range(n):
            if(l[i]==min):
                sum+=1
        print("Se han producido",sum,"pelotas de radio",min)
        break                
    else:
        print("Error. ingrese nuevamente: ")

###