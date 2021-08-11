`timescale 1ns/1ns
module Residue7 #(parameter n) (input[n-1:0]A,output [2:0]w );

assign #(138,138) w = A%7;

endmodule



