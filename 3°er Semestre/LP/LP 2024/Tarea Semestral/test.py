from collections import Counter

def elemento_mas_repetido(l): 
    contador = Counter(l)
    elemento, _ = contador.most_common(1)[0]
    return elemento

def limpiar(l): 
    palabras_a_eliminar = [',', '.']
    nueva_lista = []
    for palabra in l:
        for caracter in palabras_a_eliminar:
            palabra = palabra.replace(caracter, "")
        nueva_lista.append(palabra)
    return nueva_lista

def lista_n(n, l, l1):
    r = []
    for i in range(len(l1)):
        if l1[i] == n:
            r.append(l[i])
    return r

# Input
s = input() 
w = input() 
n = int(input())

l = s.split(".")
pw = []
num = []

for i in l:
    l1 = i.split(" ") 
    for j in range(len(l1)):
        if l1[j] == w:
            for k in range(1, n + 1):
                if j + k < len(l1):
                    pw.append(l1[j + k])
                    num.append(k)

fw = w
for i in range(1, n):
    ls = lista_n(i, pw, num)
    ls = limpiar(ls)
    fw += " " + elemento_mas_repetido(ls)
print(fw)
