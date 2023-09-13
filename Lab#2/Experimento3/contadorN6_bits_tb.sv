module contadorN6_bits_tb();
    parameter N = 6;
    logic clock;
    logic reset;
    logic resetNum;
    logic [6:0] sSegment1;
    logic [6:0] sSegment2;
    logic [N-1:0] registroContador;

    contadorN_bits #(N) contadorNBits2Test(
    .clock(clock),
    .reset(reset),
    .resetNum(resetNum),
    .registroContador(registroContador));

    initial 
    begin 
        reset = 0;
            begin
                #5;
                reset = 1;
                #5;
                reset = 0;
            end
    end

    initial 
    begin 
        clock = 0;
        repeat (40)
            begin
                #5 clock = ~clock;
            end
    end

    initial 
    begin
        reset = 0;
        #5 reset = 1;
    end

endmodule