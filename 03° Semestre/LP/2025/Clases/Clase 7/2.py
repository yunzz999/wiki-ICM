def lee_valida(x,vmin,vmax,txt2):
	while(x<vmin or x>vmax):
		x=int(input(txt2))
	return x

def potencias(x,e):
	sum=0
	for i in range(e+1):
		sum+=x**i
	print(sum)
	return 0

def main():
	x=1
	e=1
	while(x!=0 and e!=0):
		x=int(input("x: "))
		e=int(input("e: "))
		if(x==0 and e==0):
			break
		x=lee_valida(x,1,100,"Datos fuera de rango, ingrese denuevo: ")
		e=lee_valida(e,1,10000,"Datos fuera de rango, ingrese denuevo: ")
		potencias(x,e)
main()