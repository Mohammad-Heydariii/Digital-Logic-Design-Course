`timescale 1ns/1ns
module D_register (input clk,rst,Ld,input[2:0]Pin,output logic [2:0]Pout);

always@(posedge clk,posedge rst)
if(rst) Pout<=3'b0;
else Pout<=Ld?Pin:Pout;
endmodule



