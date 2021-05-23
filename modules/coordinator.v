module coordinator(clk,RST,interrupt,load,cnn,Din,Dout,ramAddress,ramDataIn,ramDataOut,readSignal,writeSignal);

input[15:0] ramAddress;
input[7:0] ramDataIn;
output[7:0] ramDataOut;
input readSignal,writeSignal;

input clk,RST,interrupt,load,cnn;
input[15:0] Din;
output[3:0] Dout;
integer i=0,isLoading=0;
reg[7:0] in1,in2;
//wire[7:0] ramDataOut,ramDataIn;
reg[31:0] byteIndx;
reg[2:0] bitIndx;
wire[31:0] newByteIndx;
wire[2:0] newBitIndx;
wire doneDecompressHandler;
reg tempWork,tempWorking;
wire ramReadSignal,ramWriteSignal,ramDoneRead,ramDoneWrite;
//wire[15:0] ramAddress;

// test bench => read file image(decompress handler), read 10 files (1-10)
// mux => WriteSignal+1/ReadSignal+1/RamDataIn (coordinator/MUX)
// file handler
// interrupt , stop signal (optional) 
//decompress_handler decompress_handler_module(in1,in2,byteIndx,bitIndx,newByteIndx,newBitIndx,tempWork,clk,RST,doneDecompressHandler,tempWorking,ramAddress,ramDataIn,ramDataOut,ramReadSignal,ramWriteSignal);
//DMA dma_module(ramAddress,ramDataIn,ramReadSignal,ramWriteSignal,ramDataOut,clk,RST,ramDoneRead,ramDoneWrite);

// we may need different ream info for each module that will interact with the ram
always @(Din,ramDataIn) begin
   $display("Din %b\n",Din);
   $display("ramDataIn %d\n",ramDataIn);
end

endmodule;