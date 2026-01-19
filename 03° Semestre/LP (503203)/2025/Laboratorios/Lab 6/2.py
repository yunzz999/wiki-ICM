def is_pal(s):
    for i in range(len(s)):
        if(s[i]!=s[len(s)-i-1]):
            return False
    return True

def main():
    n=int(input("Ingrese un numero: "))
    if(is_pal(str(n))):
        print(str(n),"es capicua")
    else:
        print(str(n),"no es capicua")

main()