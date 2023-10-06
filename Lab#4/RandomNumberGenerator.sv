module RandomNumberGenerator;

  // Declaración de una variable entera para almacenar el número aleatorio
  int myRandomNumber;

  initial begin
    // Inicializar la generación de números aleatorios
    myRandomNumber = $urandom_range(1, 63);

    // Mostrar el número aleatorio generado
    $display("Número aleatorio generado: %0d", myRandomNumber);

    // Finalizar la simulación
    $finish;
  end
endmodule

