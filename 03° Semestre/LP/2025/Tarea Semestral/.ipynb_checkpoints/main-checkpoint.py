# Erick Cristóbal Raasch Barrientos
# Terence Miguel O'Mahony Silva
# Pablo Andres Nahuelquin Torres
# Jose Benjamin Junemann Vielma


# FUNCIONES DE VALIDACION

def validar1(v):
    s=input("Ingrese la string: ")
    while(True): 
        c=False
        k=False
        if(len(s)>1000):
            k=True              # Muy largo

        for i in range(len(s)):
            if(s[i] not in v):
                c=True          #Letra no permitida

        if(k or c):
            s=input("Error la cadena ingresada posee caracteres no admitidos, ingrese denuevo: ")
        else:
            break
    return s

def validar2():
    s=input("Desea CODIFICAR o DECODIFICAR?: ")
    while(s!="CODIFICAR" and s!="DECODIFICAR"):
        s=input("Ingreso un comando no conocido, intente denuevo: ")
    return s

# FUNCIONES NUMERO <-> BINARIO.

def num2bin(n): #Funcion para pasar de numero a binario (maximo 6 bits)
    s=""
    powers2=[32,16,8,4,2,1]
    for p in powers2:
        if(n>=p):
            s+="1"
            n-=p
        else:
            s+="0"
    return s

def bin2num(s): #Funcion para pasar de binario a numero (para 6 bits)
    sum=0
    for i in range(len(s)):
        if(s[i]=="1"):
            sum+=2**(5-i)
    return sum

def not_bin(s): #Funcion para invertir 0s y 1s de un binario
    sol=""
    for i in range(len(s)):
        if(s[i]=="0"):
            sol+="1"
        else:
            sol+="0"
    return sol


# FUNCIONES TRANSFORMACION TABLA

def tdic(dic,n):                        #Funcion para transformar el diccionario
    for clave,valor in dic.items():
        if valor>=n:
            dic[clave]=valor-n
        else:
            dic[clave]=(64-n)+valor

    return dic


def tvec(vec,n):                        #Funcion para transformar el vector
    sol=[]
    for i in range(n,len(vec)):
        sol.append(vec[i])

    for i in range(n):
        sol.append(vec[i])
    return sol



#PROGRAMA

def main():
    #Informacion Tabla
    dic = {
    "A": 0,  "B": 1,  "C": 2,  "D": 3,  "E": 4,  "F": 5,  "G": 6,  "H": 7,
    "I": 8,  "J": 9,  "K": 10, "L": 11, "M": 12, "N": 13, "O": 14, "P": 15,
    "Q": 16, "R": 17, "S": 18, "T": 19, "U": 20, "V": 21, "W": 22, "X": 23,
    "Y": 24, "Z": 25, "a": 26, "b": 27, "c": 28, "d": 29, "e": 30, "f": 31,
    "g": 32, "h": 33, "i": 34, "j": 35, "k": 36, "l": 37, "m": 38, "n": 39,
    "o": 40, "p": 41, "q": 42, "r": 43, "s": 44, "t": 45, "u": 46, "v": 47,
    "w": 48, "x": 49, "y": 50, "z": 51, "0": 52, "1": 53, "2": 54, "3": 55,
    "4": 56, "5": 57, "6": 58, "7": 59, "8": 60, "9": 61, "-": 62, " ": 63}

    vec = [
    "A","B","C","D","E","F","G","H",
    "I","J","K","L","M","N","O","P",
    "Q","R","S","T","U","V","W","X",
    "Y","Z","a","b","c","d","e","f",
    "g","h","i","j","k","l","m","n",
    "o","p","q","r","s","t","u","v",
    "w","x","y","z","0","1","2","3",
    "4","5","6","7","8","9","-"," "]

    # Entradas y Validacion.
    mode=validar2()
    original=validar1(vec)
    largo=len(original)
    ultletra=original[largo-1]
    
    # Eleccion de modo
    if(mode=="CODIFICAR"):
        numero=dic[ultletra]
    
    elif(mode=="DECODIFICAR"):
        numero=(dic[ultletra]+1)%64 

    #Transformacion de la tabla.
    nuevo_dic=tdic(dic,numero)
    nuevo_vec=tvec(vec,numero)

    print()
    print()

    # Letra -> Numero -> Binario

    binarios=[]                  # Almacenamos para no calcular denuevo los numeros en binario
    for c in original:
        n=nuevo_dic[c]           # Por cada letra le asigno su numero (nueva tabla)
        binario=num2bin(n)       # Pasa numero a binario
        print(n," ("+binario+") ")
        binarios.append(binario)

    print()
    print()


    # Binario -> NOT Binario -> Letra

    solucion=""                       # Para almancenar la palabra final
    for b in binarios:
        binario1=not_bin(b)           # Modifico el binario
        n1=bin2num(binario1)          # Paso a Numero
        print(n1," ("+binario1+") ")
        solucion+=nuevo_vec[n1]       # Letra correspondiente al numero

    print()
    print()


    # Solucion
    print(solucion)
main()