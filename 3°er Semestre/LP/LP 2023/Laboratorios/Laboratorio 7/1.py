def show_p(p):
    for i in p:
        print(i,end=" ")

def show_c(c):
    c=c[::-1]
    for i in c:
        print(c,end=" ")
    
def sum_c1(c1):
    c2=[]
    c3=[]
    for i in range(7):
        c2.append(c1[i])
    for i in range(7,15):
        c3.append(c1[i])
    print(sum(c2),sum(c3))

def posicion (c):
    maximo=-10e9
    for i in range(c):
        if(c[i]>maximo):
            maximo=i
    print(i)


        