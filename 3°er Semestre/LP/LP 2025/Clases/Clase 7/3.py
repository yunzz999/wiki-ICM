def lee_valida(vmin,txt1,txt2):
	x=(input(txt1))
	while(int(x)<vmin):
		x=(input(txt2))
	return x

def suma_dig(n):
	n=str(n)
	sum=0
	for i in range(len(n)):
		sum+=int(n[i])
	return str(sum)

def main():
	m=lee_valida(0,"m: ","Error en los datos, ingrese denuevo: ")
	vi=m
	while(len(m)!=1):
		m=suma_dig(m)
		print(m)
	if(m=="3" or m=="6" or m=="9"):
		print(vi,"es divisible por 3")

main()