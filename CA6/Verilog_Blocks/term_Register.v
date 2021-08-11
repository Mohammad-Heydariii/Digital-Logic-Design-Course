module term_Register (input [15:0]trBus,input clk,rst,Ldt,output reg [15:0]term);
always@(posedge clk,posedge rst)begin
if(rst) term<=16'b0;
else if(Ldt) term<=trBus;
end

endmodule