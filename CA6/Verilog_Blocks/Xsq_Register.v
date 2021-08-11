module Xsq_Register (input [15:0]MBus,input clk,rst,Ldq,output reg [15:0]xsq);
always@(posedge clk,posedge rst)begin
if(rst) xsq<=16'b0;
else if(Ldq) xsq<=MBus;
end

endmodule