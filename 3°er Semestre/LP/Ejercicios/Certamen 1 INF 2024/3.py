def suma_divisores(n):
    suma=0
    for i in range(1,n):
        if(n%i==0):
            suma+=i
    return suma

def main():
    numero=int(input())
    jugador1=0
    jugador2=0
    for i in range(numero):
        s=input()
        s=s.split()
        puntaje1=suma_divisores(int(s[0]))
        puntaje2=suma_divisores(int(s[1]))
        if (puntaje1>puntaje2):
            print(puntaje1,puntaje2,"Gana primer jugador")
            jugador1+=1
        elif (puntaje2>puntaje1):
            print(puntaje1,puntaje2,"Gana segundo jugador")
            jugador2+=1
        elif(puntaje2==puntaje1):
            print(puntaje1,puntaje2,"EMPATE")
    if(jugador1>jugador2):
        print("Gana primer jugador")
    elif(jugador2>jugador1):
        print("Gana segundo jugador")
    elif(jugador1==jugador2):
        print("EMPATE")

main()
