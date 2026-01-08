def t_to_hour(t):
    t=t.split()
    resultado=0
    #Horas
    if(t[0][0]=="0"):
        resultado+=float(t[0][1])
    else:
        resultado+=float(t[0])
    #Minutos
    if(t[1][0]=="0"):
        resultado+=float((t[0][1]))/60
    else:
        resultado+=float((t[1]))/60
    
    #Segundos
    if(t[2][0]=="0"):
        resultado+=float((t[2][1]))/3600
    else:
        resultado+=float((t[2]))/3600

    return round(resultado,2)



def ironman(l):
    v=0
    l1=[3.8,180,42] #distancias
    for i in range(3):
        vtemp=l1[i]/l[i] #velocidad de la prueba
        print(round(vtemp,2))
        v+=vtemp*l1[i] # determinando velocidad promedio
    print(round(v/sum(l1),2))

def mironman(l):
    v=0
    l1=[1.9,90,21] #distancias
    for i in range(3):
        vtemp=l1[i]/l[i]
        print(round(vtemp,2))
        v+=vtemp*l1[i]
    print(round(v/sum(l1),2))

def olimpico(l):
    v=0
    l1=[1.5,40,10] #distancias
    for i in range(3):
        vtemp=l1[i]/l[i]
        print(round(vtemp,2))
        v+=vtemp*l1[i]
    print(round(v/sum(l1),2))

def sprint(l):
    v=0
    l1=[0.75,20,5] #distancias 
    for i in range(3):
        vtemp=l1[i]/l[i]
        print(round(vtemp,2))
        v+=vtemp*l1[i]
    print(round(v/sum(l1),2))

def main():
    p=input()
    l=[] #lista que va a contener los tiempos en horas de cada prueba
    for i in range(3):
        t1=input()
        l.append(t_to_hour(t1))

    if(p=="Medio Ironman"):
        mironman(l)
    elif(p=="Ironman"):
        ironman(l)
    elif(p=="Olimpico"):
        olimpico(l)
    elif(p=="Sprint"):
        sprint(l)

main()