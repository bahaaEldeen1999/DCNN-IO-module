// DMA => READ/WRITE
// ADDRESS =><= DATA
// calculate POS => Data DECOMPRESSED

module decompress_handler(in1,in2,byteIndx,bitIndx,newByteIndx,newBitIndx,work);
wire[255:0] buffer;
input[7:0] in1,in2;
input[31:0] byteIndx;
input[2:0] bitIndx;
input work;
wire doneSignal;
wire[31:0] byteIndxTemp; // index of the last byte that the buffer written 
wire[2:0] bitIndxTemp;// index of the new bit to write to in the 

output[31:0] newByteIndx; // index of the last byte that the buffer written 
output[2:0] newBitIndx;// index of the new bit to write to in the 
reg[15:0] ramAddress;
reg[7:0] ramData;
wire[7:0] ramDataOut;
reg read_signal,write_signal;
integer i,j,k,rightTempByteIndex,rightTempBitIndex,shift,shift_or_not,tempNewByteIndx,tempNewBitIndx,breakLoop;
decompress decompress_module(.in1(in1),.in2(in2),.out(buffer),.byteIndx(byteIndxTemp),.bitIndx(bitIndxTemp),.done(doneSignal),.work(work));
DMA DMA_module(ramAddress,ramData,read_signal,write_signal,ramDataOut);
//read clock cyle falling 

always @(doneSignal , in1 , in2 , work,buffer) begin
 
    $display("done %d in1 %d in2 %d work %d\n",doneSignal,in1,in2,work);
    if (doneSignal == 1) begin
        i = 0;
       // k = 8-bitIndx;

        // write to the first from the buffer to the memory so that we can write the rest byte by byte

    //       read_signal = 1;
    // ram_address = byteIndx;
        rightTempBitIndex = bitIndxTemp;
        rightTempByteIndex = byteIndxTemp;
        if(bitIndxTemp == 7) begin
            rightTempByteIndex=byteIndxTemp+1;
        end
        shift = (bitIndx+1); //0-7 1xxxxxxx <= byteIndx
        shift_or_not= 1;
        if (shift == 8) begin
            shift_or_not = 0;
            shift = 0;
        end


        //tempLoopingIndx = byteIndx*8+ shift;
        repeat (31) begin
           // tempLoopingIndx = tempLoopingIndx+1;
            #150
            write_signal = 1;
            ramAddress = byteIndx+shift_or_not+i;
            k=0;
            j = 0;
            j = 0;
            repeat (8) begin
                ramData[j] = in1[7]==1?0:1;
                j=j+1;
            end
            j=0;
            repeat (8) begin
             // last bit 
             //$display("j %d b1 %d b2 %d\n",j,buffer[255-shift-k-i*8] ,buffer[255-shift-k-i*8+1]);
                if((buffer[255-shift-k-i*8] != buffer[255-shift-k-i*8+1]) && ( j  == 0)) begin
                    $display("inside new temp %d\n",(( 8*byteIndx+(8-shift)+(255-(255-shift-k-i*8)))));
                    /// newBitIndx , newByteIndex
                    tempNewBitIndx = 7-( 8*byteIndx+(8-shift)+(-(-shift-k-i*8)))%8; // => 200;
                    tempNewByteIndx = i + byteIndx;
                    // if(tempNewBitIndx == 7 ) begin
                    //     tempNewByteIndx = tempNewByteIndx -1;
                    // end
                    // tempNewBitIndx = 7-tempNewBitIndx-8*(tempNewBitIndx/8);
                    j=1;
                    #10 
                    write_signal = 0;
                    
                end
               else  begin 
                    ramData[7-k] = buffer[255-shift-k-i*8];
                end
                
                k = k+1;
            end

            i = i +1;
        end
        if (shift > 0) begin
            write_signal = 1;
            ramAddress = byteIndx;
            k=shift-1;
            repeat (8) begin
                if (k >=0) begin
                    ramData[k] = buffer[255-k];
                    
                end
                if (buffer[255-k] != buffer[255-k+1]) begin
                    tempNewBitIndx =  k+1;
                    tempNewByteIndx =  byteIndx;
                end
                k = k-1;
            end
        end
        #150 
        write_signal = 0;
    end    
end

endmodule;