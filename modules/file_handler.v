module file_handler(load,clk,ramBase, RST, captured_data, write, ramAddress, ramData);
input load;// determine to load file or not 
input clk, RST;
input[15:0] captured_data;
input[15:0] ramBase;
output write;
output[15:0] ramAddress;
output[8:0] ramData;
integer i=0, temp_Write, temp_done; 
reg[7:0] firstByte;
reg[7:0] secondByte;
reg[7:0] sendByte;
reg[15:0] tempramAddress; // less than the desired address by 1
reg[15:0] tempramBase; // less than the desired address by 1
wire[7:0] ramDataOut;
reg[15:0] temp_captured_data;
`define NULL 0    

DMA DMA_module(tempramAddress, sendByte, read_signal, temp_Write, ramDataOut, clk, RST, doneRead, doneWrite);

// initial begin
//     tempramAddress = startingOffset - 1; 
// end

always @(posedge clk,load,captured_data) begin
    if (load == 1) begin
        if (i == 0) begin
            sendByte = captured_data[15:8];
            tempramAddress = ramBase; 
            temp_Write = 1; 

	    end
	    else if (i == 1) begin
	        sendByte = captured_data[7:0];
            tempramAddress = ramBase + 1; 
            temp_Write = 1;  
	    end
        $display("data %d 1b %d 2b %d sb %d tempramAddress %d i %d\n",captured_data, firstByte, secondByte, sendByte, tempramAddress,i);

        i = i + 1;
        if ( i == 2 ) begin 
            i = 0; 
        end
    end
    else begin
        temp_Write = 0;
    end
end
	assign ramData = sendByte;
	assign ramAddress = tempramAddress;
	assign write = temp_Write;
endmodule;