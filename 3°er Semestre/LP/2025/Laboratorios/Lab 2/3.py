s=int(input("Salario: "))
if(s>=1000000):
    print(s)
if(500000<=s<1000000):
    print(int(s*1.05)) #para q sea un entero.
if(s<500000):
    print(int(s*1.1))