`timescale 1ns/1ns
module Dlatch_reset(input D,Clock,reset,output Q);

wire DR,RN;
not #(6)(RN,reset);
and #(14)(DR,D,RN);
D_latch M(DR,Clock,Q);
endmodule


module Down_counter(input [7:0]Y,input Clock,reset,en,output [7:0]Q);

wire [8:0]C;
wire [7:0]D;



assign C[0]=en;

genvar i;
generate
for (i=0; i<8; i=i+1) begin

and #(14)(C[i+1],C[i],~Y[i]);

xor #(16)(D[i],C[i],Y[i]);

Dlatch_reset M(D[i],Clock,reset,Q[i]);


end
endgenerate




endmodule
