def valid (s):
    l=len(s)
    for i in range(l):
        if(i+1<l and s[i]=="0" and s[i+1]=="0"):
            return False
    
    return True

def main():
    n=input()
    if(valid(n)):
        print(n,"es un numero de",str(len(n))+"-digitos validos")
    else:
        print(n,"no es un numero valido")

main()