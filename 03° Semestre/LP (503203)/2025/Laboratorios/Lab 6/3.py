def is_digits(s):
    l=["1","2","3","4","5","6","7","8","9"]
    for i in range(len(s)):
        if(s[i] not in l):
            print("False")
            return False
    print("True")
    return True

def main():
    s=input("Ingrese la cadena: ")
    while(not is_digits(s)):
        s=input("No estaba compuesta solo por digitos, ingrese denuevo : ")
main()