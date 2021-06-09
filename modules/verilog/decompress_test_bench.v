module decompress_test_bench();

  reg [7:0] in1, in2;
  reg work;

  wire  done; 
  wire[255:0] out;
  wire[31:0] byteIndx;
  wire[3:0] bitIndx;

  decompress decompress_module(in1,in2,out,byteIndx,bitIndx,done,work);
  initial begin
     
    in1 = 8'b00000011;
    in2 = 8'b10001000;
    work = 1'b1;
    #100      
    $display("Buffer Output %d\n", out[255:245] == 11'b00011111111);          
    in1 = 8'b00001111;
    in2 = 8'b10001001;
    work = 1'b1;
    #100
    $display("Buffer Output %d\n", out[255:232] == 24'b000000000000000111111111);          
    in1 = 8'b00001000;
    in2 = 8'b10010001;
    work = 1'b1;
    #100
    $display("Buffer Output %d\n", out[255:231] == 25'b0000000011111111111111111);          
    $stop;

end

endmodule