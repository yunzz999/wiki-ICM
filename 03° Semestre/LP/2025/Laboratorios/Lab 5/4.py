def verificador(vmin,vmax,v):
    if(vmin<=v<=vmax):
        return False
    else:
        print("Error en los datos ingrese denuevo.")
        return True


s=""
personas=0
jeeps=0
while(s!="FIN"):
    s=input()
    if(s=="ENTRADA"):
        t=int(input("cantidad personas: "))
        while(verificador(0,20,t)):
            t=int(input("cantidad personas: "))
        jeeps+=1
        personas+=t
    if(s=="SALIDA"):
        t=int(input("cantidad personas: "))
        while(verificador(0,20,t)):
            t=int(input("cantidad personas: "))
        jeeps-=1
        personas-=t

print("turistas",personas,"jeeps",jeeps)