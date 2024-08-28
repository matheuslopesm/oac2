`include "goldschmidt.v"

module goldschmidt_testBench();
    reg [31:0] dividendo;
    reg [31:0] divisor;
    reg clock;
    reg reset;
    wire [31:0] quociente;

    // Instanciamos o goldschmidt no testbench
    goldschmidt gds (
        .dividendo(dividendo),
        .divisor(divisor),
        .clock(clock),
        .reset(reset),
        .quociente(quociente)
    );

    // Colocamos valores aleatórios simples para testar.
    initial begin 
        clock = 0;
        reset = 0;
        dividendo = 32'b0;
        divisor = 32'b0;

        reset = 1; #5;
        reset = 0; #5;

        dividendo = 32'h80000000; // 2147483648 em decimal
        divisor = 32'h20000000;  // 536870912 em decimal

        #100;

        $display("Quociente encontrado: %h", quociente);
        $finish;
    end

    // Alterna entre 0 e 1 a cada 5 unidades de tempo
    always #5 clock = ~clock;
endmodule