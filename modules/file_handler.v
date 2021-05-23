module file_handler(load,clk, RST, write, ramAddress, ramData);
input load;// determine to load file or not 
input clk, RST;
output write;
output[15:0] ramAddress;
output[8:0] ramData;
integer data_file; 
integer scan_file, i=0; 
reg read_signal;
reg[7:0] firstByte;
reg[7:0] secondByte;
reg[7:0] sendByte;
reg[15:0] tempramAddress= 16'b0000000000001110; // less than the desired address by 1
wire doneRead;
wire doneWrite;
wire[7:0] ramDataOut;
reg[15:0] captured_data;
`define NULL 0    

// DMA DMA_module(tempramAddress,sendByte,read_signal,1,ramDataOut,clk,RST, doneRead, doneWrite,layerNumber);

initial begin
  //tempramAddress = 16'b0000000000001111;
  // 10 files
  data_file = $fopen("bin.txt", "r");
  if (data_file == `NULL) begin
    $display("data_file handle was NULL");
    $finish;
  end
end

always @(posedge clk,load) begin
    if (load == 1) begin
        if (i == 0) begin
            scan_file = $fscanf(data_file, "%b\n", captured_data); 
            if (!$feof(data_file)) begin
                $display("line %b",captured_data);
                ramAddress= 4+layerNumber;
                write_signal  = 1;

            end
	    firstByte = captured_data[15:8];
	    secondByte = captured_data[7:0];
	    sendByte = firstByte;
	end
	else if (i == 1) begin
	    sendByte = secondByte;
	end
	i = i + 1;
        if ( i == 2 ) begin
	    i = 0;
	end
        tempramAddress = tempramAddress + 1;
    end
end
	assign ramData = sendByte;
	assign ramAddress = tempramAddress;
	assign write = 1;
endmodule;