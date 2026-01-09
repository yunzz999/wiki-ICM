n=input()
lista=n.split(" ")
lista=[int(i) for i in lista]

value=lista[0]
sum=0

for i in range(1,len(lista)):
    if(sum+lista[i]<value):
        sum+=lista[i]

print(sum)