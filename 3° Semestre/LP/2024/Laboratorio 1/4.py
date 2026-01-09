def mediana(l):
    lo=sorted(l)
    return lo[2]

def promedio(l):
    sum=0
    for i in l:
        sum+=i
    return sum/5

def main():
    l=[]
    for i in range(5):
        l.append(int(input("Ingrese la "+str(i+1)+" edad: ")))
    
    print(str(mediana(l))+", "+str(promedio(l)))

main()