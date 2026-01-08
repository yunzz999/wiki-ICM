s=input("Ingrese 2 numeros: ")
l=s.split("y") #separar input por "Y"
a=int(l[0]) #primer numero
b=int(l[1]) #segundo numero
 
if(a*b%2==0): #chequeo paridad
    r="True"
else:
    r="False"

print(a*b,"-",r) #formato del input
