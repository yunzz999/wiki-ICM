def lee_valida(vmin,vmax,txt1,txt2):
	x=int(input(txt1))
	while(x<vmin or x>vmax):
		x=int(input(txt2))
	return x

def secuencia(n):
	if(n%2==0):
		print(n,"es par")
		return 0;
	if(n%5==0):
		print(n,"es divisible por 5")
		return 0;
	s="1";
	while(int(s)%n!=0):
		s+="1"
	sol=int(s)//n
	print(sol,"-",int(s))

def main():
	m=lee_valida(1,1000,"m: ","Datos fuera de rango, ingrese denuevo: ")
	for i in range(m):
		x=int(input("n: "))
		secuencia(x)
main()