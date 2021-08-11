`timescale 1ns/1ns
module Residue7_TB();

  logic [5:0]D;
  wire [2:0]R;

  Residue7  #(6) test1(D,R);
   initial begin
 
    D= 8'b100000;
   
end
endmodule
