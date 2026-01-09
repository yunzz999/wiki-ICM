#Ejercicio 1
#P=[]
#for i in range(12):
    #temp=int(input())
    #P.append(temp)
#for i in range(12):
    #print(P[i])

#Ejercicio 2
#P=[]
#for i in range(12):
    #temp=float(input())
    #P.append(temp)
#for i in range(12):
    #print(P[11-i])

#Ejercicio 3
#C=[]
#n=int(input("N: "))
#sum1=0
#sum2=0
#for i in range(n):
    #temp=float(input())
    #C.append(temp)
#c1=C[0:n//2]
#c2=C[n//2:n]
#print(sum(c1),sum(c2))

#Ejercicio 4 (v1)
#P=[]
#max=float("-inf")
#for i in range(16):
    #temp=input()
    #if float(temp) > max:
    # #max=float(temp)
#print(max)


l=[33,1,334]
ord=sorted(l)
l.remove(l.index(ord[0]))
print(l)