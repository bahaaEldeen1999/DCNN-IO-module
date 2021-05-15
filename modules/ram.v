module DMA(address,data,read_signal,write_signal,dataout,clk,RST);
input read_signal,write_signal,clk,RST;
input[7:0] data;
output[7:0] dataout;
input[15:0] address;
reg[7:0] temp;
reg[7:0] mem[0:32768];
integer i;
always @(posedge clk) begin
    i=0;
    if (RST == 1) begin
        for(i=0;i<32768;i=i+1) begin
            mem[i] = 8'b00000000;
        end
    end

    if(read_signal == 1) begin
        temp = mem[address];
    end
    

end

always @(negedge clk) begin
    i=0;
    if (RST == 1) begin
        for(i=0;i<32768;i=i+1) begin
            mem[i] = 8'b00000000;
        end
    end
    if (write_signal == 1) begin
        mem[address] = data;
    end
    
end

assign dataout = temp;
endmodule;


