module One_Bit_MUX(Write_Files,File_Type,Write_Layer,SignalDecompressed,SignalFile,SignalCNN,SignalLayer,OutSignal);

input Write_Files,File_Type,Write_Layer;
input  SignalDecompressed,SignalFile,SignalCNN,SignalLayer;
output OutSignal;
integer  Temp;
reg [2:0]TempSelec;
always@(*)
    begin
	TempSelec[2]=Write_Files;
        TempSelec[1]=File_Type;
        TempSelec[0]=Write_Layer;
        case(TempSelec )
            3'b000: Temp=1'b0;
            3'b001: Temp=SignalLayer;
            3'b010: Temp=1'b0;
            3'b011: Temp=1'b0;//change with cnn 
            3'b100: Temp=SignalDecompressed;
            3'b101: Temp=1'b0;
            3'b110: Temp=SignalFile;
            3'b111: Temp=1'b0;
            default:Temp=1'b0;
        endcase
    end
assign OutSignal=Temp;
endmodule;