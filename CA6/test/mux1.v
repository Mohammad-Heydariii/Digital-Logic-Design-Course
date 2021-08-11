module Mux1 (input[13:0]recRom,input [15:0]xsq,xBus,input selx,selsq,selRom,output [15:0]MAin);
assign MAin=selx?xBus:selsq?xsq:selRom?{2'b0,recRom}:16'b0;
endmodule