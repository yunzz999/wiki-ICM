c1=float(input("c1: "))
c2=float(input("c2: "))
c3=float(input("c3: "))
ts=float(input("tarea semestral: "))
au=float(input("autoevaluacion: "))
prof=float(input("profesor: "))


cert=0.25*c1+0.35*c2+0.4*c3
nf=0.5*cert+0.4*ts+0.06*prof+0.04*au
if(nf>=4 and ts>=4):
    print(str(cert)+","+str(nf)+", APROBADO")
if(nf>=4 and ts<4):
    print(str(cert)+","+"NCR"+", REPROBADO")
if(nf<4 and ts>=4):
    print(str(cert)+","+str(nf)+", REPROBADO")
if(nf<4 and ts<4):
    print(str(cert)+","+"NCR"+", REPROBADO")