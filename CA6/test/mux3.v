module Mux3 (input [15:0]MBus,xBus,input selx,selM,output [15:0]trBus);
assign trBus=selx?xBus:selM?MBus:16'b0;
endmodule