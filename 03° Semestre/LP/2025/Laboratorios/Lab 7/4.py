def leevalida(m,M,txt):
	x=float(input(txt))
	while(not m<=x<=M and x!=0):
		x=input("Error, ingrese denuevo: ")
	return x

l=[0,0,0,0,0,0]
x=leevalida(1,7,"Nota: ")
while(x!=0):
	if(1<=x<2):
		l[0]+=1
	elif(2<=x<3):
		l[1]+=1
	elif(3<=x<4):
		l[2]+=1
	elif(4<=x<5):
		l[3]+=1
	elif(5<=x<6):
		l[4]+=1
	elif(6<=x<=7):
		l[5]+=1
	x=leevalida(1,7,"Nota: ")

for i in range(6):
	print(i+1,":",l[i]*"*")
