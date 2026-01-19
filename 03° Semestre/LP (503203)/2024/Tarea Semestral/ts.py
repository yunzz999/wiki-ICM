import random
from collections import Counter #

def elemento_mas_repetido(l): #funcion para encontrar el elemento mas repetido de una lista 
    contador = Counter(l)
    elemento, _ = contador.most_common(1)[0]
    return elemento

def limpiar (l):
    words=[',','.']
    for i in range(len(l)):
        for j in range(len(l[i])):
            if(l[i][j] in words):
                l[i]=l[i].replace(l[i][j],"")

def lista_n(n,l,l1):
    r=[]
    for i in range(len(l1)):
        if(l1[i]==n):
            r.append(l[i])
    return r


## Input
s=input() #toma el texto "grande"
w=input() #toma la palabra 
n=int(input()) #toma el numero de palabras en las que fijarse

l=s.split(".") #Separar cada frase por el "."
pw=[] #
num=[]
for i in l: #Recorro cada frase
    l1=i.split(" ") #Separa cada elemento frase por " "
    for j in range(len(l1)): #Recorre los elementos de la lista
        if(l1[j]==w): #Si mi palabra es la que estoy buscando entonces: 
            for k in range(1,n+1):#
                if(j+k<len(l1)):
                    pw.append(l1[j+k]) #Se agrega la palabra 
                    num.append(k) # Se agrega el indice de la palabra


fw=w
for i in range(1,n):
    ls=lista_n(i,pw,num)
    ls=limpiar(ls)
    fw+=" "+elemento_mas_repetido(ls)
print(fw)
#Faltan Nombres