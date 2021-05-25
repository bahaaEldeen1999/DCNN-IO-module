module coordinator(clk,RST,interrupt,load,cnn,Din,Dout,ramAddress,ramDataIn,ramDataOut,readSignal,writeSignal);
input clk,RST,interrupt,load,cnn,readSignal,writeSignal;
input[15:0] Din;
output [3:0] Dout;
integer i=0,isLoading=0;
input[7:0] ramDataIn ; //what is ramDataOut
output[7:0] ramDataOut;
wire [7:0] tempDataToRAM;
reg[31:0] byteIndx;
reg[2:0] bitIndx;
wire[31:0] newByteIndx;
wire[2:0] newBitIndx;
wire doneDecompressHandler;
reg tempWork,tempWorking;
wire ramReadSignal,ramWriteSignal,ramDoneRead,ramDoneWrite,choosedRamWriteSignal;
input[15:0] ramAddress;
wire [7:0] ramDataOutFile,ramDataOutCompressed;
wire[15:0] ramAdressCompressed,ramAdressFile,ramAdressCnn,tempAdressToRAM;
integer FirstTime=1;
wire  [7:0] ramDataOutModules; 
wire tempDoneReadSignal,tempDoneWriteSignal;

decompress_handler decompress_handler_module(Din[15:8],Din[7:0],byteIndx,bitIndx,newByteIndx,newBitIndx,tempWork,clk,RST,doneDecompressHandler,tempWorking,ramAdressCompressed,ramDataOutCompressed,ramDataOutModules,ramReadSignal,ramWriteSignal);
file_handler file_handler_module(load,clk,ramAddress,RST,Din, write,ramAdressFile, ramDataOutFile);
MUX Data_In_MUX(load,cnn,writeSignal,ramDataOutCompressed,ramDataOutFile,8'b00000000,ramDataIn,tempDataToRAM);//make sure of the selectors //done
ST_Bit_MUX Adress_In_MUX(load,cnn,writeSignal,ramAdressCompressed,ramAdressFile,16'b0000000000000000,ramAddress,tempAdressToRAM);//make sure of the selectors //done
One_Bit_MUX Write_Mux(load,cnn,writeSignal,ramWriteSignal,write,1'b0,writeSignal,choosedRamWriteSignal);// what is 
DMA dma_module(tempAdressToRAM,tempDataToRAM,ramReadSignal,choosedRamWriteSignal,ramDataOutModules,clk,RST,tempDoneReadSignal,tempDoneWriteSignal);
// MUX Data_Out_MUX(selector0,selector1);
// we may need different ream info for each module that will interact with the ram
always @(clk) begin
   if (cnn==0 && load==1 &&FirstTime==1)
    begin
        byteIndx=ramAddress;
        bitIndx=0;
        FirstTime=0;

    end

    if (doneDecompressHandler==1)
    begin
        byteIndx=newByteIndx;
        bitIndx=newBitIndx;
    end
end
assign ramDataOut=ramDataOutModules;
endmodule;