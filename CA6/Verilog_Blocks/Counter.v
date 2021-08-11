module Counter (input clk,rst,I0C,InC,output reg [2:0]addrRom,output oe,CO);

always@(posedge clk,posedge rst)begin
if(rst) addrRom<=3'b0;
else if(I0C) addrRom<=3'b0;
else if (InC) addrRom<=addrRom+1;
end

assign CO=&{addrRom};
assign oe=addrRom[0];

endmodule