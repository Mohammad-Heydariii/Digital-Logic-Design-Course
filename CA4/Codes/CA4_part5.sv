`timescale 1ns/1ns 
module _48_bit_res_TB(); 
 logic [5:0]D_in; 
 logic Clock=0; 
 logic Reset; 
 wire Start,Ready; 
 wire [2:0]D_out; 
 _48_bit_residue res(D_in,Clock,Reset,D_out,Start,Ready); 
 initial begin 
  Reset=1; 
  #220 
  Clock=1; 
  #330 
  Clock=0;
  #330 
  Reset=0; 
  #310 
  D_in=6'd58; //2 
  #310 
  Clock=1; 
  #320 
  Clock=0; 
  #310 
  D_in=6'd8; //1 
  #310 
  Clock=1; 
  #320 
  Clock=0; 
  #310 
  D_in=6'd63; //0 
  #310 
  Clock=1; 
  #320 
  Clock=0; 
  #310 
  D_in=6'd10; //3 
  #310 
  Clock=1; 
  #320 
  Clock=0; 
  #310 
  D_in=6'd12; //5 
  #310 
  Clock=1; 
  #320 
  Clock=0; 
  #310 
  D_in=6'd2; //2 
  #310 
  Clock=1; 
  #320 
  Clock=0; 
  #310 
  D_in=6'd50; //1 
  #310 
  Clock=1; 
  #320 
  Clock=0; 
  #310 
  D_in=6'd9; //2 
  #320 
  Clock=1; 
  #320 
  Clock=0; 
  #400 
  $stop; 
 end 
endmodule
