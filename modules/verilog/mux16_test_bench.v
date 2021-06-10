module mux16_test_bench();

  reg Load,Image,Layer;
  reg [15:0] AddressInDecompressed,AddressInFile,AddressInCNN,AddressLayerInput;

  wire[15:0] AddressToRAM;

  ST_Bit_MUX ST_Bit_MUX_module(Load,Image,Layer,AddressInDecompressed,AddressInFile,AddressInCNN,AddressLayerInput,AddressToRAM);
  initial begin
     
    Layer = 1'b1;
    AddressLayerInput = 16'b0;
    AddressInCNN = 16'b0;
    #100     
    $display("address Output %d\n", AddressToRAM[15:0] == 16'b0);     

    Layer = 1'b0;     
    Load = 1'b1;
    Image = 1'b1;
    AddressInFile = 16'b0000000000000011;
    #100     
    $display("address Output %d\n", AddressToRAM[15:0] == 16'b0000000000000011);  

    Image = 1'b0;
    AddressInDecompressed = 16'b0000000000001001;
    #100     
    $display("address Output %d\n", AddressToRAM[15:0] == 16'b0000000000001001); 

    Load = 1'b0;
    #100     
    $display("address Output %d\n", AddressToRAM[15:0] == 16'b0000000000000000); 
    $stop;

end

endmodule