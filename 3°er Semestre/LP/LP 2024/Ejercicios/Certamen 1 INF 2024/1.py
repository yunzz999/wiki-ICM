numero=int(input())
numero_invertido=0

while numero > 0:
    digito = numero % 10 #digito = numero%10
    numero_invertido = (numero_invertido * 10) + digito 
    numero = numero // 10

print(numero_invertido)


#n[::-1]