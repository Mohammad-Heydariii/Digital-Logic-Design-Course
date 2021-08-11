module expr_Register (input [15:0]exBus,input clk,rst,Lde,output reg [15:0]expr);
always@(posedge clk,posedge rst)begin
if(rst) expr<=16'b0;
else if(Lde) expr<=exBus;
end


endmodule