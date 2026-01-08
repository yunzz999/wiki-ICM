capacidad=int(input())
g_fruta=int(input())
dias=[]
temp=0
while(True):
    temp=int(input())
    if(temp==-1):
        break
    #FALTA VALIDAR
    dias.append(temp)
resto=0
frascos=0
for i in range(len(dias)):
    recoleccion=g_fruta*dias[i] # lo que se recolecta
    if(capacidad>recoleccion+resto):
        resto=recoleccion+resto
        print(0)
    elif(capacidad<=recoleccion+resto):
        frascos=int(recoleccion+resto)//capacidad
        print(frascos)
        resto=recoleccion+resto-capacidad*frascos 
print(resto)