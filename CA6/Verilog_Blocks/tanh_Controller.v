
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