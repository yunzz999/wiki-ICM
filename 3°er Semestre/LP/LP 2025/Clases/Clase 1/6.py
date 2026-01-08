#input: simbolo,numero
s=input()
l=s.split(",") # separo por coma para saber el numero y el simbolo
num=int(l[1]) #num pos 1,obtengo el numero
simb=l[0] # simbolo pos 0, obtengo simbolo

print(num*simb) #linea de arriba

print(simb+ (num-2)*" " +simb) #n-2 espacios vacios

print(num*simb) 






