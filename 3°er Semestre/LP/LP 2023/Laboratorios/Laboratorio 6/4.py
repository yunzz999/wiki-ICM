def clasificador(l):
    l1=[0,0,0,0,0,0]
    for i in l:
        if(1.0<=i<=1.9):
            l1[0]+=1
        elif(2.0<=i<=2.9):
            l1[1]+=1
        elif(3.0<=i<=3.9):
            l1[2]+=1
        elif(4.0<=i<=4.9):
            l1[3]+=1
        elif(5.0<=i<=5.9):
            l1[4]+=1
        elif(6.0<=i<=7.0):
            l1[5]+=1
    return l1

def main():
    s=input()
    ss=s.split(',')
    
    l= [float(num)for num in ss]
    l1=clasificador(l)

    for i in range(5):
        s=str(i+1)
        print(s+ ".0-" + s +".9 |" + "*"*l1[i] )
    print("6.0-7.0 |"+"*"*l1[5])

main()

##xd