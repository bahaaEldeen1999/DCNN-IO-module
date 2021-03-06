module DMA(address,data,read_signal,write_signal,dataout,clk,RST, doneRead, doneWrite);
input read_signal,write_signal,clk,RST;
input[15:0] data;
output[15:0] dataout;
input[15:0] address;
reg[15:0] temp;
reg[15:0] mem[0:1000];
output doneRead;
integer done_read=0;
integer done_write=0;
output doneWrite;
integer i;
always @(negedge clk) begin


     if(read_signal == 1) begin
                //$display("readSignal %d\n",read_signal);
        
        temp <= mem[address];
        done_read<=1;
    end
    else if (write_signal == 1) begin
           // $display("writeSignal %d\n",write_signal);

        mem[address] <= data;
        done_write<=1;
    end

end
assign doneRead = done_read;
assign doneWrite = done_write;
// always @(negedge clk) begin
    
// end

assign dataout = temp;
endmodule;


