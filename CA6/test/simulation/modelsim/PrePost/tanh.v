module tanh_Dp (input clk,rst,input [15:0]xBus,output[15:0] rBus,output oe,CO,input Ldq,Ldt,Lde,selx,selsq,selM,sela,selt,selRom,I0C,InC,sub);

reg [15:0]xsq,term,expr;

wire [15:0]addBus,MBus,MAin,MBin,trBus,exBus;

wire [13:0]recRom;
wire [31:0]Mo;
reg [2:0]addrRom;

assign addBus=sub?(expr-term):(expr+term);
assign Mo=MAin * MBin;
assign MBus=Mo[29:14];

assign MAin=selx?xBus:selsq?xsq:selRom?{2'b0,recRom}:16'b0;
assign MBin=selx?xBus:selt?term:16'b0;

assign rBus={2'b0,expr[13:0]};
assign trBus=selx?xBus:selM?MBus:16'b0;
assign exBus=selx?xBus:sela?addBus:16'b0;

always@(posedge clk,posedge rst)begin
if(rst) xsq<=16'b0;
else if(Ldq) xsq<=MBus;
end

always@(posedge clk,posedge rst)begin
if(rst) term<=16'b0;
else if(Ldt) term<=trBus;
end

always@(posedge clk,posedge rst)begin
if(rst) expr<=16'b0;
else if(Lde) expr<=exBus;
end
always@(posedge clk,posedge rst)begin
if(rst) addrRom<=3'b0;
else if(I0C) addrRom<=3'b0;
else if (InC) addrRom<=addrRom+1;
end
assign CO=&{addrRom};
assign oe=addrRom[0];
assign recRom=(addrRom==3'b000)?14'b01010101010101:(addrRom==3'b001)?14'b01100110011001:(addrRom==3'b010)?14'b01100111100111:(addrRom==3'b011)?14'b10001010010100:(addrRom==3'b100)?14'b00000100001100:(addrRom==3'b101)?14'b00111000000011:(addrRom==3'b110)?14'b00000001101100:(addrRom==3'b111)?14'b00010110101101:14'b0;                                                                                    
endmodule
module tanh_Controller (input clk,rst,input Start,oe,CO,output reg Ldq,Ldt,Lde,selx,selsq,selM,sela,selt,selRom,I0C,InC,sub,Ready);
reg [2:0]ps,ns;
always@(posedge clk,posedge rst)begin
if(rst) ps<=3'b0;
else ps<=ns;
end
always@(Start,CO,ps)begin
ns=3'b0;
case(ps)
3'b000:if(Start) ns=3'b001; else ns=3'b0;
3'b001:if(Start) ns=3'b001; else ns=3'b010;
3'b010: ns=3'b011;
3'b011: ns=3'b100;
3'b100: ns=3'b101;
3'b101: if(CO) ns=3'b0;  else ns=3'b011;
default ns=3'b0;
endcase
end
always@(Start,CO,ps,oe)begin
{Ldq,Ldt,Lde,selx,selsq,selM,sela,selt,selRom,I0C,InC,sub,Ready}=13'b0;
case(ps)
3'b000:Ready=1'b1;
3'b010: {Lde,Ldt,selx,Ldq,I0C}=5'b11111;
3'b011:{selsq,selt,selM,Ldt}=4'b1111;
3'b100:{selRom,selt,selM,Ldt}=4'b1111;
3'b101: if(~oe) {Lde,sela,InC,sub}=4'b1111;     else    {Lde,sela,InC,sub}=4'b1110;      
default {Ldq,Ldt,Lde,selx,selsq,selM,sela,selt,selRom,I0C,InC,sub,Ready}=13'b0;
endcase
end
endmodule
module tanh (input clk,rst,input [15:0]xBus,input Start,output Ready,output [15:0] rBus);
wire Ldq,Ldt,Lde,selx,selsq,selM,sela,selt,selRom,I0C,InC,sub,oe,CO;
tanh_Dp Dp(clk,rst,xBus,rBus,oe,CO,Ldq,Ldt,Lde,selx,selsq,selM,sela,selt,selRom,I0C,InC,sub);
tanh_Controller Cu(clk,rst,Start,oe,CO,Ldq,Ldt,Lde,selx,selsq,selM,sela,selt,selRom,I0C,InC,sub,Ready);
endmodule
