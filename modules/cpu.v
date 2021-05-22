module cpu(clk,RST,interrupt,load,cnn);

input clk,RST,interrupt,load,cnn;


integer i=0,isLoading=0;
reg[7:0] in1,in2;
wire[7:0] ramDataOut,ramDataIn;
reg[31:0] byteIndx;
reg[2:0] bitIndx;
wire[31:0] newByteIndx;
wire[2:0] newBitIndx;
wire doneDecompressHandler;
reg tempWork,tempWorking;
wire ramReadSignal,ramWriteSignal,ramDoneRead,ramDoneWrite;
wire[15:0] ramAddress;
decompress_handler decompress_handler_module(in1,in2,byteIndx,bitIndx,newByteIndx,newBitIndx,tempWork,clk,RST,doneDecompressHandler,tempWorking,ramAddress,ramDataIn,ramDataOut,ramReadSignal,ramWriteSignal);
DMA dma_module(ramAddress,ramDataIn,ramReadSignal,ramWriteSignal,ramDataOut,clk,RST,ramDoneRead,ramDoneWrite);

// we may need different ream info for each module that will interact with the ram
always @(clk) begin
   
end

endmodule;