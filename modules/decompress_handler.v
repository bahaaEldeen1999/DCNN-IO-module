// DMA => READ/WRITE
// ADDRESS =><= DATA
// calculate POS => Data DECOMPRESSED

module decompress_handler(in1,in2,byteIndx,bitIndx,newByteIndx,newBitIndx,work,clk,RST,done,working);
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
reg read_signal,write_signal;
// temporary integer values 
integer i,j,k,rightTempByteIndex,rightTempBitIndex,shift,shift_or_not,tempNewByteIndx,tempNewBitIndx,breakLoop,noOfBitsWrittenInFirstByte,rep,tempDone;
// decompress module
decompress decompress_module(.in1(in1),.in2(in2),.out(buffer),.byteIndx(byteIndxTemp),.bitIndx(bitIndxTemp),.done(doneSignal),.work(work));
// ram DMA module
DMA DMA_module(ramAddress,ramData,read_signal,write_signal,ramDataOut,clk,RST);
//read clock cyle falling 

always @(doneSignal,in1,in2,buffer,work,working) begin
    rep = in1[6:0];
    tempNewBitIndx =   (bitIndx-rep%8)%8;
    tempNewByteIndx =  (7-bitIndx+rep+byteIndx*8)/8;
    $display("done %d in1 %d in2 %d work %d\n",doneSignal,in1,in2,work);
    tempDone = 0;
    if (doneSignal == 1 && working == 1) begin
        #500
        
        i = 0;

        // write to the first from the buffer to the memory so that we can write the rest byte by byte
        rightTempBitIndex = bitIndxTemp;
        rightTempByteIndex = byteIndxTemp;
        if(bitIndxTemp == 7) begin
            rightTempByteIndex=byteIndxTemp+1;
        end
        shift = (bitIndx+1); //0-7 
        // check if there is any byte after the shift if not then set shift to zero
        // check first 8 bits that there is enough for the shift 
        // there is a bug in three corner cases 
        // 1- byte not completely filled 
        // 2- byte becomes completely filled
        // 3- byte overflow
        shift_or_not= 1;
        j = 0;
        // determine if the frst byte is completely empty so i can start putting the whole 8 bits in it, or if i should skip some bits determinsed by shift amount
        if (shift == 8) begin
            shift_or_not = 0;
            shift = 0;
        end
        // initialize no of bits wriiten in forst byte to the whole no of shift, and check if i will will have enough amount of bits in the buffer to fill the word or if i will have to stop at some point earlier
        noOfBitsWrittenInFirstByte = shift;
        breakLoop = 0;
        repeat (8) begin
            if (buffer[255-j] != buffer[255-j-1] && shift>0) begin
                breakLoop = 1;
                noOfBitsWrittenInFirstByte= j+1;
            end
            j = j+1;
        end
        // make sure that noOfBitsWrittenInFirstByte doesn,t exceed the shift 
        if (noOfBitsWrittenInFirstByte > shift) begin
            noOfBitsWrittenInFirstByte = shift;
            breakLoop = 0;
        end

        $display("shift %d noOfBitsWrittenInFirstByte %d\n",shift,noOfBitsWrittenInFirstByte);
        repeat (31) begin
           if(breakLoop == 0) begin
                #150
                write_signal = 1;
                ramAddress = byteIndx+shift_or_not+i;
                j=0;
                k=0;
                repeat (8) begin   
                    ramData[7-k] = buffer[255-shift-k-i*8];             
                    k = k+1;
                end

                i = i +1;
           end
        end
        #10
        // we want to first read the data from the first byte index so we don't overwrite it 
        if (shift > 0) begin
            write_signal = 0;
            ramAddress = byteIndx;
            read_signal = 1;
            #100
            // now data is availabe in ramDataOut
            k=0;
            repeat (8) begin
                ramData[k]=ramDataOut[k];
                k = k+1;
            end
            read_signal = 0;
            // ramData = mem[ByteIndx]
            #100
            write_signal = 1;
            k=shift-1;// k = bitIndx
            repeat (8) begin
                // write 
                if (noOfBitsWrittenInFirstByte >0) begin
                    ramData[k] = buffer[255-(shift-1-k)];
                    noOfBitsWrittenInFirstByte = noOfBitsWrittenInFirstByte-1;
                end
                k = k-1;
                j = j+1;
            end
        end
        #150 
        write_signal = 0;
        tempDone  =1;
    end    
end
    // always @(negedge clk) begin
        
    // end
       assign  newByteIndx = tempNewByteIndx;
       assign newBitIndx = tempNewBitIndx;
       assign  done = tempDone;

endmodule;