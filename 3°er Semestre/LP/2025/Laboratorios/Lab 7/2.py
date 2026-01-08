s=input("nombre: ")
l=[]
while(s!=""):
	l.append(s)
	s=input("nombre: ")

largo=len(l)
temp=l[0]
l[0]=l[largo-1]
l[largo-1]=temp

print(l)