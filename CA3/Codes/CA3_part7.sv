`timescale 1ns/1ns
module Master_slave(input D,input Clock,output Q);

wire Z,CN;
not #(6)(CN,Clock);
D_latch n1(D,Clock,Z);
D_latch n2(Z,CN,Q);

endmodule

