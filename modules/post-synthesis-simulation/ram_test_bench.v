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
    data=16'b1111000000001101;
    RST=1'b0;
    #100 
    address=16'b1;
    write_signal=1'b1;
    read_signal=1'b0;
    data=16'b1111000011110000;
    #100        
    address=16'b0000000000000010;
    write_signal=1'b1;
    read_signal=1'b0;
    data=16'b1111000000001111;
    #100 
    address=16'b0000000000000011;
    write_signal=1'b1;
    read_signal=1'b0;
    data=16'b1111000000000001;
    #100 
    address=16'b0000000000000100;
    write_signal=1'b1;
    read_signal=1'b0;
    data=16'b1111000000001001;
    #100 
    address=16'b0000000000000101;
    write_signal=1'b1;
    read_signal=1'b0;
    data=16'b1001000000000001;
    #100 
    address=16'b0000000000000110;
    write_signal=1'b1;
    read_signal=1'b0;
    data=16'b1100110000000111;
    #100 
    address=16'b0000000000000111;
    write_signal=1'b1;
    read_signal=1'b0;
    data=16'b1100000000000101;
    #100 
    address=16'b0000000000001000;
    write_signal=1'b1;
    read_signal=1'b0;
    data=16'b1110000000000011;
    #100 
    address=16'b0000000000001001;
    write_signal=1'b1;
    read_signal=1'b0;
    data=16'b1010000000000001;
    #100 
    address=16'b0;
    write_signal=1'b0;
    read_signal=1'b1;
    #100   
    $display("Data Out %d\n",dataout==16'b1111000000001101);     
    address=16'b1;
    write_signal=1'b0;
    read_signal=1'b1;
    #100
    $display("Data Out %d\n",dataout==16'b1111000011110000); 
    address=16'b0000000000000010;
    write_signal=1'b0;
    read_signal=1'b1;
    #100
    $display("Data Out %d\n",dataout==16'b1111000000001111); 
    address=16'b0000000000000011;
    write_signal=1'b0;
    read_signal=1'b1;
    #100 
    $display("Data Out %d\n",dataout==16'b1111000000000001);
    address=16'b0000000000000100;
    write_signal=1'b0;
    read_signal=1'b1;
    #100
    $display("Data Out %d\n",dataout==16'b1111000000001001); 
    address=16'b0000000000000101;
    write_signal=1'b0;
    read_signal=1'b1;
    #100
    $display("Data Out %d\n",dataout==16'b1001000000000001); 
    address=16'b0000000000000110;
    write_signal=1'b0;
    read_signal=1'b1;
    #100
    $display("Data Out %d\n",dataout==16'b1100110000000111); 
    address=16'b0000000000000111;
    write_signal=1'b0;
    read_signal=1'b1;
    #100
    $display("Data Out %d\n",dataout==16'b1100000000000101); 
    address=16'b0000000000001000;
    write_signal=1'b0;
    read_signal=1'b1;
    #100
    $display("Data Out %d\n",dataout==16'b1110000000000011);
    address=16'b0000000000001001;
    write_signal=1'b0;
    read_signal=1'b1;
    #100  
    $display("Data Out %d\n",dataout==16'b1010000000000001);
    $stop;
end
endmodule;