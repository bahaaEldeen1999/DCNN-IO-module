module DMA(address,data,read_signal,write_signal,dataout);
input read_signal,write_signal;
input[7:0] data;
output[7:0] dataout;
input[15:0] address;
reg[7:0] temp;
reg[7:0] mem[0:32768];
always @(read_signal or write_signal or address or data) begin
    if(read_signal == 1) begin
        temp = mem[address];
    end
    if (write_signal == 1) begin
        mem[address] = data;
    end
end

assign dataout = temp;
endmodule;


