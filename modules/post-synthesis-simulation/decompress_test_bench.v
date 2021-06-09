module decompress_test_bench();

  reg [2:0] in1, in2;
  reg work;

  wire  done; 
  wire[7:0] out;
  wire[31:0] byteIndx;
  wire[3:0] bitIndx;

  decompress decompress_module(in1,in2,out,byteIndx,bitIndx,done,work);
  initial begin
     
    in1 = 3'b011;
    in2 = 3'b101;
    work = 1'b1;
    #100
    $display("Buffer Output %d\n", out[7:4] == 4'b0001);
    #100
   in1 = 3'b111;
    in2 = 3'b011;
    #100
    $display("Buffer Output %d\n", out[7:2] == 6'b111000);
    in1 = 3'b001;
    in2 = 3'b101;
    #100
    $display("Buffer Output %d\n", out[7:6] == 2'b01);
    #100
    $stop;

end

endmodule
