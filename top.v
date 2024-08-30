module dividir (input [19:0]divisor, 
                input [19:0]dividendo,
                output reg [19:0] quociente);

  reg [19:0] apDividendo, apDivisor; 
  reg [19:0] equacaoF; 
  reg [39:0] tempDividendo;
  reg [39:0] tempDivisor;
  integer i;

 always @(*) begin
    
    apDividendo = dividendo;
    apDivisor = divisor;
    equacaoF = divisor >> 7; 

    for (i = 0; i < 5; i = i + 1) begin
        tempDividendo = (equacaoF * apDividendo);
        tempDivisor = (equacaoF * apDivisor);
        apDividendo = tempDividendo[31:12];
        apDivisor = tempDivisor[31:12];     
        equacaoF = 20'b00000010_000000000000 - apDivisor; 

        // Imprime os valores a cada iteração
        $display("-----------");
        $display("Iteracao %0d", i);
        $display("ApDividendo: %b", apDividendo);
        $display("ApDivisor: %b", apDivisor);
        $display("equacaoF: %b", equacaoF);
        $display("-----------");
    end

    quociente = apDividendo;

   end
endmodule
