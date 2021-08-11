module Add_Subtract (input [15:0]expr,term,input sub,output [15:0]addBus);

assign addBus=sub?(expr-term):(expr+term);

endmodule