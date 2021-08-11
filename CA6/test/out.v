module outt (input [15:0]expr,output [15:0]out);
assign out={2'b0,expr[13:0]};
endmodule