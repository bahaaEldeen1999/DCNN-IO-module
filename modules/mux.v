module MUX(Load,Image,Layer,DataInDecompressed,DataInFile,DataInCNN,LayerInput,ToRAM);

input Load,Image,Layer;
input [7:0] DataInDecompressed,DataInFile,DataInCNN,LayerInput;
reg [7:0] Temp,TempIn ;
output[7:0] ToRAM;
reg [2:0] TempSelec ;
always@(*)
    begin
        TempSelec[2]=Load;
        TempSelec[1]=Image;
        TempSelec[0]=Layer;
	// $display("Load,Image,Layer \n");
    // $display("TempSelec %d \n",TempSelec);
        case(TempSelec)        
        3'b000: Temp=8'b00000000;
        3'b001: Temp=LayerInput;
        3'b010: Temp=8'b00000000;
        3'b011: Temp=8'b00000000;//change with cnn 
        3'b100: Temp=DataInDecompressed;
        3'b101: Temp=8'b00000000;
        3'b110: Temp=DataInFile;
        3'b111: Temp=8'b00000000;
        default:Temp=8'b00000000;
    endcase
end
assign ToRAM=Temp;
endmodule;