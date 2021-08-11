`timescale 1ns/1ns
module flipflop_reset(input D,Clock,reset,output Q);

wire DR,RN;
not #(6)(RN,reset);
and #(14)(DR,D,RN);

Master_slave m(DR,Clock,Q);


endmodule






