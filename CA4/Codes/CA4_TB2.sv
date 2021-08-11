`timescale 1ns/1ns
module D_registerTB();
  logic clk,rst,Ld;
  logic [2:0]Pin=3'b110;
  wire [2:0]Pout;
D_register m(clk,rst,Ld,Pin,Pout);
initial begin
Ld=1;rst=0;clk=1;
#400 Ld=0;
#300 rst=1;
#400 clk=0;
#100 Ld=1;
#400 $stop;
end
endmodule
