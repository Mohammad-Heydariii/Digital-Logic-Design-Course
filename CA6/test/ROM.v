module ROM (input [2:0]addrRom,output [13:0]recRom);
assign recRom=(addrRom==3'b000)?14'b01010101010101:(addrRom==3'b001)?14'b01100110011001:(addrRom==3'b010)?14'b01100111100111:(addrRom==3'b011)?14'b10001010010100:(addrRom==3'b100)?14'b00000100001100:(addrRom==3'b101)?14'b00111000000011:(addrRom==3'b110)?14'b00000001101100:(addrRom==3'b111)?14'b00010110101101:14'b0;                                                                                    

endmodule