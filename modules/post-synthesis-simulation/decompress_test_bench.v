module decompress_test_bench();

  reg [2:0] in1, in2;
  reg work;
  
  wire  done; 
  wire[7:0] out;
  wire[31:0] byteIndx;
  wire[3:0] bitIndx;
  decompress decompress_module(in1,in2,out,byteIndx,bitIndx,done,work);
  initial begin
     
    in1 = 3'b001;
    in2 = 3'b101;
    work = 1'b1;
    #100
    $display("Buffer Output %b", out[7:6]==2'b01);
    in1 = 3'b001;
    in2 = 3'b110;
    work = 1'b1;
    #100
    $display("Buffer Output %b", out[7:5]==3'b011);
    in1 = 3'b001;
    in2 = 3'b111;
    work = 1'b1;
    #100
    $display("Buffer Output %b", out[7:4]==4'b0111);
    ////////////////////////////////////////////
    in1 = 3'b010;
    in2 = 3'b101;
    work = 1'b1;
    #100
    $display("Buffer Output %b", out[7:5]==2'b001);
    in1 = 3'b010;
    in2 = 3'b110;
    work = 1'b1;
    #100
    $display("Buffer Output %b", out[7:4]==3'b0011);
    in1 = 3'b010;
    in2 = 3'b111;
    work = 1'b1;
    #100
    $display("Buffer Output %b", out[7:3]==4'b00111);
    ///////////////////////////////////////////
    in1 = 3'b011;
    in2 = 3'b101;
    work = 1'b1;
    #100
    $display("Buffer Output %b", out[7:4]==2'b0001);
    in1 = 3'b011;
    in2 = 3'b110;
    work = 1'b1;
    #100
    $display("Buffer Output %b", out[7:3]==3'b00011);
    in1 = 3'b011;
    in2 = 3'b111;
    work = 1'b1;
    #100
    $display("Buffer Output %b", out[7:2]==4'b000111);
    $stop;
end

endmodule
