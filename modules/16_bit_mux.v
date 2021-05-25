module ST_Bit_MUX(Load,Image,Layer,AddressInDecompressed,AddressInFile,AddressInCNN,AddressLayerInput,AddressToRAM);

input Load,Image,Layer;
input [15:0] AddressInDecompressed,AddressInFile,AddressInCNN,AddressLayerInput;
reg [15:0] Temp,TempIn ;
output[15:0] AddressToRAM;
reg [2:0] TempSelec ;
always@(*)
    begin
        TempSelec[2]=Load;
        TempSelec[1]=Image;
        TempSelec[0]=Layer;
	// $display("Load,Image,Layer \n");
    // $display("TempSelec %d \n",TempSelec);
        case(TempSelec)        
        3'b000: Temp=16'b0000000000000000;
	//3'b000: $display("Load,Image,Layer %d %d %d\n",Load,Image,Layer);
        3'b001: Temp=AddressLayerInput;
        3'b010: Temp=16'b0000000000000000;
        3'b011: Temp=16'b0000000000000000;//change with cnn 
        3'b100: Temp=AddressInDecompressed;
        3'b101: Temp=16'b0000000000000000;
        3'b110: Temp=AddressInFile;
        3'b111: Temp=16'b0000000000000000;
        default:Temp=16'b0000000000000000;
    endcase
end
assign AddressToRAM=Temp;
endmodule;