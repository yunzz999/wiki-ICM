def valid_t(t):
    while(t!="FIN" and t!="SALIDA" and t!="ENTRADA"):
        t=input("Entrada erronea,ingrese denuevo: ")
    return t

def valid_n(n):
    while(n<0 or n>20):
        n=int(input("Entrada erronea, ingrese denuevo: "))
    return n

t=""
sum=0
jeep=0
while(True):
    t=input()
    t=valid_t(t)
    if(t=="FIN"):
        break
    n=int(input())
    n=valid_n(n)
    if(t=="ENTRADA"):
        sum+=n
        jeep+=1
    elif(t=="SALIDA"):
        sum=sum-n
        jeep=jeep-1

print(sum,jeep)