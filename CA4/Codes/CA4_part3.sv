`timescale 1ns/1ns
module modulo_8counter(input clk,rst,Cen,output Cout,output logic [2:0]Cnt);

always@(posedge clk,posedge rst)begin
if(rst) Cnt<=3'b0;
else if(Cen) Cnt<=Cnt+1;
end
assign Cout=&{Cnt,Cen};

endmodule



