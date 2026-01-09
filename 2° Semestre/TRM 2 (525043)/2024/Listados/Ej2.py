import math
def prime(n):
	for i in range(2,int(math.sqrt(n))):
		if n%i==0:
			return False
	return True

def main():
	p1=3
	for i in range(4,100000):
		if(prime(i) and i-p1>=20):
			print("Encontrado: ",i,p1)
			return 0
		elif(prime(i)):
			p1=i

main()