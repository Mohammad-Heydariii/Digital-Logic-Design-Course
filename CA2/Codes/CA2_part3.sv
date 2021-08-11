`timescale 1ns/1ns
module adder16(input[15:0]a,b,input c0 ,output[15:0]s,output c16);
wire [16:0]c;
assign c[0]=c0;
genvar i;
generate 
for(i=0;i<16;i=i+1)begin : FAs
FA Ii(a[i],b[i],c[i],c[i+1],s[i]);

end
endgenerate

assign c16=c[16];



endmodule


