t=int(input())
for i in range (t):
	amigos=int(input())
	aparatos=int(input())
	cota_sup=0
	cota_inf=0
	for j in range (aparatos):
		cantidad=int(input())
		maximo=-1
		minimo=10**8
		for k in range (cantidad):
			current=int(input())
			maximo=max(maximo,current)
			minimo=min(minimo,current)
		cota_inf+=minimo
		cota_sup+=maximo
	print(cota_inf//amigos," ",cota_sup//amigos)



