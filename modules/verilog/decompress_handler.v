// DMA => READ/WRITE
// ADDRESS =><= DATA
// calculate POS => Data DECOMPRESSED

module decompress_handler(in1,in2,byteIndx,bitIndx,newByteIndx,newBitIndx,work,clk,RST,done,working,ramAddress,ramDataOut,ramDataIn,ramReadSignal,ramWriteSignal);
wire[255:0] buffer;
input[7:0] in1,in2;
input[31:0] byteIndx;
input[3:0] bitIndx;
input work,working;
input clk,RST;
wire doneSignal;
output done;
wire[31:0] byteIndxTemp; // index of the last byte that the buffer written 
wire[3:0] bitIndxTemp;// index of the new bit to write to in the 
output[31:0] newByteIndx; // index of the last byte that the buffer written 
output[3:0] newBitIndx;// index of the new bit to write to in the 
reg[15:0] ramAddressReg;
reg[15:0] ramDataReg;
wire[15:0] ramDataOutReg;

integer index;
reg read_signal,write_signal;
wire doneRead;
wire doneWrite;
// temporary integer values 
integer i=0,j,k,rightTempByteIndex,rightTempBitIndex,shift,shift_or_not,tempNewByteIndx,tempNewBitIndx,breakLoop,noOfBitsWrittenInFirstByte,rep,tempDone;
// decompress module
decompress decompress_module(.in1(in1),.in2(in2),.out(buffer),.byteIndx(byteIndxTemp),.bitIndx(bitIndxTemp),.done(doneSignal),.work(work));

output[15:0] ramAddress;
output[15:0] ramDataOut;
input[15:0] ramDataIn;
output ramReadSignal,ramWriteSignal;

always @(posedge clk) begin

    if(i==0||i==1) begin
        
    rep = in1[6:0]+in2[6:0];
    index=255;
    tempNewBitIndx =   (bitIndx-rep%16)%16;
    tempNewByteIndx =  (15-bitIndx+rep+byteIndx*16)/16;

        if (doneSignal == 1 && working == 1) begin
            tempDone = 0;
      
            shift = (bitIndx+1)%16; 
            shift_or_not= 1;
            j = 0;
            if (shift == 0) begin
                shift_or_not = 0;
                // shift = 0;
            end
     
            if (shift > 0) begin
                if(i==0)begin
                    write_signal = 0;
                    ramAddressReg = byteIndx;
                    read_signal = 1;     

                end
                else if(i==1)begin
                    ramAddressReg = byteIndx;
                    write_signal = 1;
                    read_signal = 0;
                    k=15;
                    repeat (16) begin
                        if(k>=0&&k<shift)begin
                            ramDataReg[k] = buffer[index];
                            index=index-1;
                        end
                        else begin
                            ramDataReg[k] = ramDataIn[k];     
                        end
                        k = k-1;

                    end
          
                end
            end
            i=i+1;        
        end
    end
    else if(i<34) begin  
         
                write_signal = 1;
                read_signal = 0;
                ramAddressReg = byteIndx+shift_or_not+i-2;
                j=0;
                k=15;
                repeat (16) begin   
                    ramDataReg[k] = buffer[index];
                    index=index-1;
                    k = k-1;
                end
                i = i +1;
    end
    if (i>= 34) begin
        i = 0;
        tempDone = 1;
    end
  
end

       assign  newByteIndx = tempNewByteIndx;
       assign newBitIndx = tempNewBitIndx;
       assign  done = tempDone;
       assign ramAddress = ramAddressReg;
       assign ramDataOut = ramDataReg;
       assign ramReadSignal = read_signal;
       assign ramWriteSignal = write_signal;

endmodule;

