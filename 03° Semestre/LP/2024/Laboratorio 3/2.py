def resta (M,N):
    return M-N

def main():

    N=int(input("Ingrese el primer Numero:"))
    while(N<0):
        N=int(input("El numero ingresado debe ser mayor o igual a 0, intente denuevo: "))

    M=int(input("Ingrese el segundo Numero:"))
    while(M<0):
        N=int(input("El numero ingresado debe ser mayor o igual a 0, intente denuevo: "))

    print(resta(N,M))

main()