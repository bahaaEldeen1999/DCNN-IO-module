module file_handler(load,clk,ramBase, RST, captured_data, write, ramAddress, ramData);
input load;// determine to load file or not 
input clk, RST;
input[15:0] captured_data;
input[15:0] ramBase;
output write;
output[15:0] ramAddress;
output[15:0] ramData;
integer i=0, temp_Write, temp_done; 



always @(posedge clk) begin
    if (load == 1) begin
        
        temp_Write = 1;
   
    end
    else begin
        temp_Write = 0;
    end
end
	assign ramData = captured_data;
	assign ramAddress = ramBase;
	assign write = temp_Write;
endmodule;