module Mux4 (input [15:0]addBus,xBus,input selx,sela,output [15:0]exBus);
assign exBus=selx?xBus:sela?addBus:16'b0;
endmodule