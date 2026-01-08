def promedio_certamenes (x,y,z):
    return 0.1*x+0.2*y+0.3*z


def main():
    c1=float(input("Ingrese la nota del primer certamen: "))
    c2=float(input("Ingrese la nota del segundo certamen: "))
    c3=float(input("Ingrese la nota del tercer certamen: "))
    ts=float(input("Ingrese la nota de la tarea semestral: "))
    ae=float(input("Ingrese la nota de la auto evaluacion: "))
    nd=float(input("Ingrese la nota de la nota de desempeño: "))
    
    certamenes= promedio_certamenes(c1,c2,c3)
    pf=0.5*certamenes+0.4*ts+0.04*ae+0.06*nd
    if(pf>=4 and ts>=4):
        print(str(certamenes)+" "+str(pf)+" APROBADO")
    elif (pf>=4 and ts<4):
        print(str(certamenes)+" NCR"+" REPROBADO")
    elif(pf<4 and ts>4):
        print(str(certamenes)+str(pf)+" REPROBADO")
    else:
        print(str(certamenes)+" "+str(pf)+" REPROBADO")

main()