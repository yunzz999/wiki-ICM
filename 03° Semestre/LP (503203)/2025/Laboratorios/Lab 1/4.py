s=input("Ingrese las 5 edades: ")
#input de la forma a , b , c , d , e
l=s.split(",") #separo por coma
sum=0
for i in range(len(l)): #bucle en la lista
    sum+=int(l[i]) # sumo cada edad
mid=len(l)//2 #encuentro el punto medio (para media)
print(str(l[mid])+",",sum/len(l)) 

