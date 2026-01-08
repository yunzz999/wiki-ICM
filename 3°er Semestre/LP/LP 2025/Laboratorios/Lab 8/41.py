def distancia(l1, l2):
    return sum((l1[i] - l2[i]) ** 2 for i in range(3)) ** 0.5

def tbateria(b, metros):
    return b - (metros / 50)

bateria = int(input("bateria: "))

# Leer recorrido
m = []
while True:
    x = int(input("x: "))
    y = int(input("y: "))
    z = int(input("z: "))
    if x == 0 and y == 0 and z == 0:
        break
    m.append([x, y, z])

origen = [0, 0, 0]
b = bateria
actual = origen

for punto in m:
    d = distancia(actual, punto)
    b = tbateria(b, d)
    # Calcular batería necesaria para volver al origen
    d_vuelta = distancia(punto, origen)
    bateria_restante_para_volver = tbateria(b, d_vuelta)
    if bateria_restante_para_volver < 0:
        # El dron debe volver desde el punto anterior
        d_vuelta = distancia(actual, origen)
        bateria_restante_para_volver = tbateria(b + d, d_vuelta)
        print(round(max(bateria_restante_para_volver, 0), 3))
        break
    actual = punto
else:
    # Si terminó el recorrido y no fue necesario regresar antes
    d_vuelta = distancia(actual, origen)
    bateria_restante_para_volver = tbateria(b, d_vuelta)
    print(round(max(bateria_restante_para_volver, 0), 3))
