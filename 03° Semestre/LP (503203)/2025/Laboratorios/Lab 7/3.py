s=input("nombre: ")
l=[]
mini=""
while(s!=""):
	if(s<mini):
		
	l.append(s)
	s=input("nombre: ")

largo=len(l)
temp=l[0]
l[0]=l[largo-1]
l[largo-1]=temp

print(l)