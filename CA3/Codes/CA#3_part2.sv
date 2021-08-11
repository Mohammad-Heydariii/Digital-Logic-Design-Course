`timescale 1ns/1ns
module D_latch(input D,Clock,output Q);

wire DB;

not#(6)(DB,D);

SR_latch M(D,DB,Clock,QB,Q);

endmodule







