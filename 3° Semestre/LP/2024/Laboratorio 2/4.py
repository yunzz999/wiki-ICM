def main():
    N=int(input("Ingrese las coordenadas de division (x): "))
    M=int(input("Ingrese las coordenadas de division (y): "))

    x=int(input("Ingrese sus coordenadas (x): "))
    y=int(input("Ingrese sus coordenadas (y): "))

    if(x==N or y==M):
        print("Frontera")
    elif (x>N and y>M):
        print("Nlogonia Noroccidental")
    elif(x<N and y>M):
        print("Nlogonia Nororiental")
    elif(x<N and y<M):
        print("Nlogonia Sudoriental")
    elif(x>N and y<M):
        print('Nlogonia Sudoccidental')

main()

## ejemplo de prueba esta mal??