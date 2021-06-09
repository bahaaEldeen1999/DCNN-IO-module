module ram_test_bench(clk);

input clk;
reg read_signal,write_signal,RST;
reg[15:0] data;
reg[15:0] address;
wire[15:0] dataout;
wire doneRead;
wire doneWrite;

DMA DMA_module(address,data,read_signal,write_signal,dataout,clk,RST, doneRead, doneWrite);

initial begin
    RST=1'b1;
    #100
    address=16'b0;
    write_signal=1'b1;
    read_signal=1'b0;
    data=16'b1111000000000001;
    RST=1'b0;
    #100 
    address=16'b1;
    write_signal=1'b1;
    read_signal=1'b0;
    data=16'b1111000011110000;
    #100        
    address=16'b1;
    write_signal=1'b0;
    read_signal=1'b1;
    #100  
    $display("Data Out %d\n",dataout==16'b1111000011110000);
    address=16'b0;
    write_signal=1'b0;
    read_signal=1'b1;
    #100  
    $display("Data Out %d\n",dataout==16'b1111000000000001);
    $stop;
end
endmodule;