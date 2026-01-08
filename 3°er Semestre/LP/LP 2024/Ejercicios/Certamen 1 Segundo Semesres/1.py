autos=int(input())
pago=0
for i in range(autos):
	tiempo=int(input())
	velocidad=int(input())
	largo=velocidad*tiempo
	if(velocidad>14):
		print("Longitud del vehiculo:",largo,"+ multa: 100")
		pago+=(2*largo)+100
	else:
		print("Longitud del vehiculo:",largo)
		pago+=2*largo
print("\n\nRecaudacion total: $"+str(pago))


		