`timescale 1 ns / 100 ps
module tb();
reg [19:0] a;
reg [19:0] b; 
wire [19:0]c;

dividir U1 (.divisor(b), .dividendo(a), .quociente(c));
initial
  begin
	$dumpfile("output.vcd");
	$dumpvars; $display("Starting simulation");
  	a = 20'b00000000_000000000000;
  	b = 20'b00000000_000000000000;
	#10 a = 20'b01010110_000000000000;
        b = 20'b00000111_000000000000;

	#10 $display("Simulation ended.");
	$finish;
  end
initial
  $monitor($time, " a = %b, b = %b, c = %b", a, b, c);
endmodule
