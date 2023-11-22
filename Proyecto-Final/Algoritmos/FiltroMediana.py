datos_en_memoria_imagen = [0, 30, 20, 10, 40,
                           50, 60, 70, 120, 160,
                           100, 130, 80, 110, 140,
                           150, 90, 170, 180, 190,
                           200, 210, 220, 230, 240]  # el 150 está en (x,y)

L = len(datos_en_memoria_imagen)
tamano_fila = 5
memoria_de_imagen_filtrada = [0] * 25

posicion = 0
contador = 0

while posicion < 25:
    if posicion < 5 or posicion >= 19:
        memoria_de_imagen_filtrada[posicion] = datos_en_memoria_imagen[posicion]
    else:
        if contador == 0 or contador == 4:
            memoria_de_imagen_filtrada[posicion] = datos_en_memoria_imagen[posicion]
            contador += 1
        else:
            lista_mediana = []
            lista_mediana.extend(datos_en_memoria_imagen[posicion + offset] for offset in [-tamano_fila-1, -tamano_fila, -tamano_fila+1, -1, 0, 1, tamano_fila-1, tamano_fila, tamano_fila+1])
            lista_mediana.sort()
            memoria_de_imagen_filtrada[posicion] = lista_mediana[4]
            contador += 1

    posicion += 1

print("Lista con la imagen filtrada:")
for i in range(5):
    fila = memoria_de_imagen_filtrada[i * 5: (i + 1) * 5]
    print(fila)
