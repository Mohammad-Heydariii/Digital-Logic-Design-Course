module Mux2 (input [15:0]term,xBus,input selx,selt,output [15:0]MBin);
assign MBin=selx?xBus:selt?term:16'b0;
endmodule