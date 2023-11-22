.section .data
datos_en_memoria_imagen:
    .word 0, 30, 20, 10, 40, 50, 60, 70, 120, 160, 100, 130, 80, 110, 140, 150, 90, 170, 180, 190, 200, 210, 220, 230, 240

.section .bss
memoria_de_imagen_filtrada:
    .space 100   @ Reservar espacio para 25 enteros (4 bytes cada uno)

lista_mediana:
    .space 36    @ Reservar espacio para 9 enteros (4 bytes cada uno)

.section .text
.global _start

_start:
    MOV R3, #0      @ posicion
    MOV R4, #0      @ contador

main_loop:
    CMP R3, #25     @ comparar posicion con 25
    BGE end_program @ si posición >= 25, salir del bucle

    CMP R3, #5      @ comparar posición con 5
    BLT not_border_upper  @ si posición < 5, saltar a not_border_upper

    CMP R3, #19     @ comparar posición con 19
    BGE not_border_upper  @ si posición >= 19, saltar a not_border_upper

    CMP R4, #0      @ comparar contador con 0
    BEQ counter_is_zero   @ si contador es 0, saltar a counter_is_zero

    CMP R4, #4      @ comparar contador con 4
    BEQ counter_is_four   @ si contador es 4, saltar a counter_is_four

    B else_condition  @ saltar a else_condition

not_border_upper:
    LDR R1, =datos_en_memoria_imagen  @ dirección base de datos_en_memoria_imagen
    LDR R2, =memoria_de_imagen_filtrada  @ dirección base de memoria_de_imagen_filtrada
    ADD R5, R1, R3, LSL #2   @ calcular la dirección de datos_en_memoria_imagen[posicion]
    LDR R6, [R5]             @ cargar datos_en_memoria_imagen[posicion] en R6
    STR R6, [R2, R3, LSL #2]  @ almacenar en memoria_de_imagen_filtrada[posicion]

    B next_iteration  @ saltar a next_iteration

counter_is_zero:
    LDR R1, =datos_en_memoria_imagen
    LDR R2, =memoria_de_imagen_filtrada
    ADD R5, R1, R3, LSL #2
    LDR R6, [R5]
    STR R6, [R2, R3, LSL #2]
    ADD R4, R4, #1    @ incrementar contador
    B next_iteration

counter_is_four:
    LDR R1, =datos_en_memoria_imagen
    LDR R2, =memoria_de_imagen_filtrada
    ADD R5, R1, R3, LSL #2
    LDR R6, [R5]
    STR R6, [R2, R3, LSL #2]
    MOV R4, #0       @ reiniciar contador
    B next_iteration

else_condition:
    LDR R1, =datos_en_memoria_imagen
    LDR R2, =memoria_de_imagen_filtrada
    ADD R5, R1, R3, LSL #2
    LDR R6, [R5]
    STR R6, [R2, R3, LSL #2]
    LDR R7, =lista_mediana
    ADD R7, R7, #20  @ ajustar la dirección para lista_mediana
    LDR R8, [R5, #4] @ cargar datos_en_memoria_imagen[posicion + 1] en R8
    STR R8, [R7, #4] @ almacenar en lista_mediana[1]
    LDR R8, [R5, #-4]  @ cargar datos_en_memoria_imagen[posicion - 1] en R8
    STR R8, [R7, #-4]  @ almacenar en lista_mediana[2]
    LDR R8, [R5, #-20] @ cargar datos_en_memoria_imagen[posicion - tamano_fila] en R8
    STR R8, [R7, #-20] @ almacenar en lista_mediana[3]
    LDR R8, [R5, #-24] @ cargar datos_en_memoria_imagen[posicion - tamano_fila - 1] en R8
    STR R8, [R7, #-24] @ almacenar en lista_mediana[4]
    LDR R8, [R5, #-16] @ cargar datos_en_memoria_imagen[posicion - tamano_fila + 1] en R8
    STR R8, [R7, #-16] @ almacenar en lista_mediana[5]
    LDR R8, [R5, #20]  @ cargar datos_en_memoria_imagen[posicion + tamano_fila] en R8
    STR R8, [R7, #20]  @ almacenar en lista_mediana[6]
    LDR R8, [R5, #16]  @ cargar datos_en_memoria_imagen[posicion + tamano_fila - 1] en R8
    STR R8, [R7, #16]  @ almacenar en lista_mediana[7]
    LDR R8, [R5, #24]  @ cargar datos_en_memoria_imagen[posicion + tamano_fila + 1] en R8
    STR R8, [R7, #24]  @ almacenar en lista_mediana[8]

    LDR R5, =lista_mediana
    LDR R6, [R5, #4]   @ cargar lista_mediana[1] en R6
    LDR R7, [R5, #8]   @ cargar lista_mediana[2] en R7
    LDR R8, [R5, #12]  @ cargar lista_mediana[3] en R8
    LDR R9, [R5, #16]  @ cargar lista_mediana[4] en R9
    LDR R10, [R5, #20] @ cargar lista_mediana[5] en R10
    LDR R11, [R5, #24] @ cargar lista_mediana[6] en R11
    LDR R12, [R5, #-4]  @ cargar lista_mediana[7] en R12
    LDR R13, [R5, #-8]  @ cargar lista_mediana[8] en R13

    BL sort_list

    LDR R5, =lista_mediana
    LDR R6, [R5, #16]  @ cargar lista_mediana[4] en R6
    STR R6, [R2, R3, LSL #2]  @ almacenar en memoria_de_imagen_filtrada[posicion]

    ADD R4, R4, #1    @ incrementar contador

next_iteration:
    ADD R3, R3, #1    @ incrementar posición
    B main_loop

end_program:
    MOV R7, #1        @ código de salida del programa
    SWI 0             @ llamar al sistema operativo para salir del programa

sort_list:
    PUSH {LR}         @ almacenar el enlace de retorno en la pila
    LDR R5, =lista_mediana
    LDR R6, [R5, #16]
    LDR R7, [R5, #20]
    CMP R6, R7
    BGE swap_elements
    B pop_lr_and_return

swap_elements:
    STR R7, [R5, #16]
    STR R6, [R5, #20]

pop_lr_and_return:
    POP {LR}          @ restaurar el enlace de retorno desde la pila
    BX LR             @ devolver el control al llamador
