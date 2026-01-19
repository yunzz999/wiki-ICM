def new_word(s):
    l=["a","e","i","o","u","A","E","I","O","U"," "]
    x=""
    for i in range(len(s)):
        if(s[i] not in l):
            x+="*"

        else:
            x+=s[i]
    return x


def main():
    s=input("Ingrese una palabra/frase: ")
    print(new_word(s))

main()