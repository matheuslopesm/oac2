module goldschmidt(
    input [31:0] dividendo, // Número a ser dividido
    input [31:0] divisor,  // Número pelo qual vamos dividir
    input clock,             // Sinal de clock
    input reset,             // Sinal de reset
    output reg [31:0] quociente // Resultado da divisão

);
    reg [31:0] apResultado, apDivisor; // xn: aproximação do resultado, dn: aproximação do divisor
    reg [31:0] equacaoF; // Equação iterativa: Fx = 2 - Dx
    integer i;

    // Sempre que houver mudança no clock ou no reset, executamos esse bloco
    always@(posedge clock or posedge reset) begin
      
      // Se o valor de reset for 1, as aproximações e o quociente serão 0
      if (reset) begin
        apResultado <= 32'b0;
        apDivisor <= 32'b0;
        quociente <= 32'b0;
      end else begin
      // Caso contrário, atribuímos outros valores
        apResultado <= dividendo;
        apDivisor <= divisor;

        // Agora fazemos as iterações corrigindo
        for (i = 0; i < 5; i = i + 1) begin
            equacaoF = 32'h40000000 - apDivisor; // Calculo 2 - Dx

            apResultado = (equacaoF * apResultado) >> 30; // Faz a multiplicação com o valor anterior de apResultado
            apDivisor = (equacaoF * apDivisor) >> 30; // Faz a multiplicação com o valor anterior de apDivisor

            // Imprime os valores a cada iteração
            $display("-----------");
            $display("Iteração %0d", i);
            $display("ApResultado: %h", apResultado);
            $display("ApDivisor: %h", apDivisor);
            $display("equacaoF: %h", equacaoF);
            $display("-----------");
        end

        quociente = apResultado; // O resultado depois de todas iterações
      end
    end
endmodule