`timescale 1ns/1ns
module modulo_8counter_TB();
  logic clk=0,rst=1,Cen=1;
  wire Cout;
  wire [2:0]Cnt;

modulo_8counter test3(clk,rst,Cen,Cout,Cnt);
initial repeat (30) begin
 #104 clk = ~clk;
end
initial begin
#30 rst=0; 
   
end
endmodule
