`timescale 1ns/1ns
module SR_latch(input S,R,Clock,output QB,Q);

wire r,s;

nand #(8,8) m1(s,S,Clock);
nand #(8,8) m2(r,R,Clock);
nand #(8,8) m3(QB,r,Q);
nand #(8,8) m4(Q,s,QB);

endmodule
