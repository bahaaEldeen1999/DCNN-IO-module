// DMA => READ/WRITE
// ADDRESS =><= DATA
// calculate POS => Data DECOMPRESSED

module decompress_handler(in1,in2,byteIndx,bitIndx,newByteIndx,newBitIndx,work,clk,RST,done,working,ramAddress,ramDataOut,ramDataIn,ramReadSignal,ramWriteSignal);
wire[255:0] buffer;
input[7:0] in1,in2;
input[31:0] byteIndx;
input[2:0] bitIndx;
input work,working;
input clk,RST;
wire doneSignal;
output done;
wire[31:0] byteIndxTemp; // index of the last byte that the buffer written 
wire[2:0] bitIndxTemp;// index of the new bit to write to in the 

output[31:0] newByteIndx; // index of the last byte that the buffer written 
output[2:0] newBitIndx;// index of the new bit to write to in the 
reg[15:0] ramAddress;
reg[7:0] ramData;
wire[7:0] ramDataOut;
wire[7:0] temp;

integer index;
reg read_signal,write_signal;
wire doneRead;
wire doneWrite;
// temporary integer values 
integer i=0,j,k,rightTempByteIndex,rightTempBitIndex,shift,shift_or_not,tempNewByteIndx,tempNewBitIndx,breakLoop,noOfBitsWrittenInFirstByte,rep,tempDone;
// decompress module
decompress decompress_module(.in1(in1),.in2(in2),.out(buffer),.byteIndx(byteIndxTemp),.bitIndx(bitIndxTemp),.done(doneSignal),.work(work));
// ram DMA module
//DMA DMA_module(ramAddress,ramData,read_signal,write_signal,ramDataOut,clk,RST, doneRead, doneWrite);
//read clock cyle falling 

// to remove dma from decompress handlker we have to out ram info
output[15:0] ramAddress;
output[7:0] ramDataOut;
input[7:0] ramDataIn;
output ramReadSignal,ramWriteSignal;
always @(posedge clk) begin
    $display("i %d\n",i);

    if(i==0||i==1) begin
    rep = in1[6:0]+in2[6:0];
    index=255;
    tempNewBitIndx =   (bitIndx-rep%8)%8;
    tempNewByteIndx =  (7-bitIndx+rep+byteIndx*8)/8;
    $display("done %d in1 %d in2 %d work %d\n",doneSignal,in1,in2,work);
    tempDone = 0;
    if (doneSignal == 1 && working == 1) begin
 
        // write to the first from the buffer to the memory so that we can write the rest byte by byte
        // rightTempBitIndex = bitIndxTemp;
        // rightTempByteIndex = byteIndxTemp;
        // if(bitIndxTemp == 7) begin
        //     rightTempByteIndex=byteIndxTemp+1;
        // end
        shift = (bitIndx+1)%8; //0-7 
        // check if there is any byte after the shift if not then set shift to zero
        // check first 8 bits that there is enough for the shift 
        // there is a bug in three corner cases 
        // 1- byte not completely filled 
        // 2- byte becomes completely filled
        // 3- byte overflow
        shift_or_not= 1;
        j = 0;
        // determine if the frst byte is completely empty so i can start putting the whole 8 bits in it, or if i should skip some bits determinsed by shift amount
        if (shift == 0) begin
            shift_or_not = 0;
            // shift = 0;
        end
        // // initialize no of bits wriiten in forst byte to the whole no of shift, and check if i will will have enough amount of bits in the buffer to fill the word or if i will have to stop at some point earlier
        // noOfBitsWrittenInFirstByte = shift;
        // breakLoop = 0;
        // repeat (8) begin
        //     if (buffer[255-j] != buffer[255-j-1] && shift>0) begin
        //         breakLoop = 1;
        //         noOfBitsWrittenInFirstByte= j+1;
        //     end
        //     j = j+1;
        // end
        // make sure that noOfBitsWrittenInFirstByte doesn,t exceed the shift 
        // if (noOfBitsWrittenInFirstByte > shift) begin
        //     noOfBitsWrittenInFirstByte = shift;
        //     breakLoop = 0;
        // end
        if (shift > 0) begin
            if(i==0)begin
                write_signal = 0;
                ramAddressReg = byteIndx;
                read_signal = 1;
                $display("read_signal %d i %d\n",read_signal,i);      

            end
            else if(i==1)begin
                ramAddress = byteIndx;
                write_signal = 1;
                read_signal = 0;
                $display("read_signal %d i %d\n",read_signal,i);      

                // now data is availabe in ramDataOut
                k=7;
                repeat (8) begin
                    if(k>=0&&k<shift)begin
                        ramData[k] = buffer[index];
                        index=index-1;
                    end
                    else begin
                        ramData[k] = ramDataOut[k];
                        $display("temp %d\n",ramDataOut[k]);      
                    end
                    k = k-1;

                end
                // ramData = mem[ByteIndx]
        
                // k=shift-1;// k = bitIndx
                // repeat (8) begin
                //     // write 
                //     if (noOfBitsWrittenInFirstByte >0) begin
                //         ramData[k] = buffer[index];
                //         index=index-1;
                //         noOfBitsWrittenInFirstByte = noOfBitsWrittenInFirstByte-1;
                //     end
                //     k = k-1;
                //     j = j+1;
                // end
            end
        end
        i=i+1;        
    end
    end
    else if(i<34) begin        
                write_signal = 1;
                read_signal = 0;
                ramAddress = byteIndx+shift_or_not+i-2;
                j=0;
                k=7;
                repeat (8) begin   
                    ramData[k] = buffer[index];
                    index=index-1;
                    k = k-1;
                end
                i = i +1;
    end
    // if (i>= 32) begin
    //     i = 0;
    // end
  
end

       assign  newByteIndx = tempNewByteIndx;
       assign newBitIndx = tempNewBitIndx;
       assign  done = tempDone;
       assign ramAddress = ramAddressReg;
       assign ramDataOut = ramDataReg;
       assign ramReadSignal = read_signal;
       assign ramWriteSignal = write_signal;

endmodule;

