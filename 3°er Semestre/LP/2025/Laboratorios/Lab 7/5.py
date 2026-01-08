def leevaldia(m,M,txt):
	x=int(input(txt))
	while(not m<=x<=M):
		x=int(input("Error ingrese denuevo: "))
	return x

x=leevaldia(2,100,"n: ")
l=[]
for i in range(x):
	s=input("s: ")
	if(s not in l):
		l.append(s)
l.sort()
print(l)
