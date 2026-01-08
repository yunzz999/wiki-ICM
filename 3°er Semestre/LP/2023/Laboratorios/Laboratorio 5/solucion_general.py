def palindrome(s):
    if(s==s[::-1]):
        return True
    else:
        return False

def capicua (n):
    n=str(n)
    if(n==n[::-1]):
        return True
    else:
        return False

def digitos(s):
    for i in s:
        if not i.isdigit() and i!="-":
            s1=input("Error ingrese una cadena valida: ")
            digitos(s1)
    return True

def consonantes(s):
    consonantes="bcdfghjklmnñpqrstvwxyz"
    consonantes=consonantes.split()
    r=""
    for i in s:
        if i not in s:
            r+=i
        else:
            r+="*"
    return r


def look_and_say(n,v):
    for i in range(n):
        r=""
    count=1
    for j in range(len(v)):
        if(j+1<len(v) and v[j]==v[j+1]):
            count+=1
        else:
            r+=str(count)+str(v[j])
            count=1
    if(r!=""):
        v=r 
    print(v)





