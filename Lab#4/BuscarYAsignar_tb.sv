module BuscarYAsignar_tb;

  reg [7:0] numerosABuscar [3:0]; // Una lista de números a buscar
  reg [7:0] matriz [7:0][7:0];
  wire [7:0] resultado [7:0][7:0];

  // Instancia del módulo BuscarYAsignar
  BuscarYAsignar uut (
    .numerosABuscar(numerosABuscar), // Cambiamos el nombre de la señal
    .matriz(matriz),
    .resultado(resultado)
  );

  // Generación de estímulos
  initial begin
    // Inicializar los números a buscar y la matriz
    numerosABuscar[0] = 27; // Por ejemplo, buscamos el número 27
    numerosABuscar[1] = 42; // Otro número a buscar
    numerosABuscar[2] = 15; // Otro número a buscar
    numerosABuscar[3] = 10; // Otro número a buscar
    // Inicializar la matriz con valores conocidos
    // Puedes ajustar los valores de la matriz según tus necesidades
    matriz[0][0] = 27;
    matriz[2][4] = 42;
    matriz[5][7] = 15;

    // Ejecutar la simulación durante un período
    #10;

    // Finalizar la simulación
    $finish;
  end

  // Proceso de impresión de resultados
  always @* begin
    integer i, j;
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        $display("Resultado en [%d][%d]: %d", i, j, resultado[i][j]);
      end
    end
  end

endmodule
