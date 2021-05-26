module MUX(Load,Image,Layer,DataInDecompressed,DataInFile,DataInCNN,LayerInput,ToRAM);

input Load,Image,Layer;
input [15:0] DataInDecompressed,DataInFile,DataInCNN,LayerInput;
reg [15:0] Temp,TempIn ;
output[15:0] ToRAM;
reg [2:0] TempSelec ;
always@(Load,Image,Layer,DataInDecompressed,DataInFile,DataInCNN,LayerInput)
    begin
        TempSelec[2]=Load;
        TempSelec[1]=Image;
        TempSelec[0]=Layer;
	// $display("Load,Image,Layer \n");
    // $display("TempSelec, layer %d %d \n",TempSelec,Layer);
    if(Layer==1)
    begin
        Temp=LayerInput;
    end
    else if(Load==1)
        begin
            if(Image==1)
            begin
                Temp=DataInFile;
            end
            else
            begin
              Temp=DataInDecompressed;
            end
        end
    else
        begin
            Temp=16'b0000000000000000;
        end
    //     case(TempSelec)        
    //     3'b000: Temp=8'b00000000;
    //     3'b001: Temp=LayerInput;
    //     3'b010: Temp=8'b00000000;
    //     3'b011: Temp=8'b00000000;//change with cnn 
    //     3'b100: Temp=DataInDecompressed;
    //     3'b101: Temp=8'b00000000;
    //     3'b110: Temp=DataInFile;
    //     3'b111: Temp=8'b00000000;
    //     default:Temp=8'b00000000;
    // endcase
end
assign ToRAM=Temp;
endmodule;