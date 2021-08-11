`timescale 1ns/1ns 
module tanh_TB(); 
 reg [15:0]xBus; 
 reg clk=0; 
 reg rst=0; 
 reg Start=0;
 wire Ready; 
 wire [15:0]rBus,ppBus;
tanh Test1(clk,rst,xBus,Start,Ready,rBus);
pptanh Test2(clk,rst,xBus,Start,Ready,ppBus);
initial repeat(1000) begin
#200 clk=~clk;
end
initial begin 
#200 rst=1;
#200 rst=0;
#500 Start=1;
#400 Start=0;
#400 xBus=16'b0010001100110011;
#80000 $stop; 
end 
endmodule
