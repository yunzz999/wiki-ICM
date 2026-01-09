def verificador(n):
    if(0<n<=25):
        return False
    else:
        print("Error en los datos")
        return True

def aprobo(c1,c2,c3,ts,au,prof):
    cert=0.2*c1+0.3*c2+0.5*c3 #NOTA CERT
    nf=0.5*cert+0.4*ts+0.06*prof+0.04*au #NOTA FINAL
    if(nf>=4): #APROBO
        print(str(cert)+","+str(nf)+", APROBADO")
    if(nf<4): #REPROBO
        print(str(cert)+","+str(nf)+", REPROBADO")



def main():
    n=int(input("n: "))
    while(verificador(n)):
        n=int(input("n: "))
    for i in range(n):
        c1=float(input("c1: "))
        c2=float(input("c2: "))
        c3=float(input("c3: "))
        ts=float(input("tarea semestral: "))
        au=float(input("autoevaluacion: "))
        prof=float(input("profesor: "))
        aprobo(c1,c2,c3,ts,au,prof)

main()