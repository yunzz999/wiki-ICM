s=input()
n=int(s[2:len(s)]) #obtiene todo el numero
if(n>0):
    print("Positivo")
elif(n<0):
    print("Negativo")
else:
    print("Cero")