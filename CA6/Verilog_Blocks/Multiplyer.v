module Multiplyer (input [15:0]M1,M2,output [15:0]MBus);
wire [31:0]Mo;
assign Mo=M1*M2;
assign MBus=Mo[29:14];

endmodule