def is_pal(s):
    for i in range(len(s)):
        if(s[i]!=s[len(s)-i-1]):
            return False
    return True


def main():
    s=input("Ingrese una palabra/frase: ")
    if(is_pal(s)):
        print(s,"es palindrome")
    else:
        print(s,"no es palindrome")
main()