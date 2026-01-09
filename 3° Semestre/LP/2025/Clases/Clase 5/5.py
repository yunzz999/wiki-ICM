def validador1(n):
    if(1<n<=100):
        return False
    else:
        print("Error en el input...")
        return True

def validador2(h):
    if(0<h<=15):
        return False
    else:
        print("Error en el input...")
        return True

n=int(input("n: "))
while(validador1(n)):
    n=int(input("n: "))
sol=0
maxi=-1
for i in range(n):
    h=int(input("h"+str(i+1)+": "))
    while(validador2(h)):
        h=int(input("h"+str(i+1)+": "))
    if(h>maxi):
        maxi=h
        sol=1
    elif(h==maxi):
        sol+=1

print(sol)