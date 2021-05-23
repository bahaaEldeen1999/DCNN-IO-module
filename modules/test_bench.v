module test_bench(clk);
parameter clockCycleTime = 100;
parameter delayDecompress = (clockCycleTime*34);
parameter numberOfLayers = 3;
parameter maxnumberOfLayers = 10;
parameter  filterSize = 5;
parameter [7:0] noOfFilterLayers[0:maxnumberOfLayers-1]  = {8'd10,8'd20,8'd30,8'd40,8'd50,8'd60,8'd70,8'd80,8'd90,8'd100}  ;
parameter [7:0] noOfDenseLayers[0:maxnumberOfLayers-2]  = {8'd10,8'd20,8'd30,8'd40,8'd50,8'd60,8'd70,8'd80,8'd90}  ;
input clk;
reg RST,load,cnn,interrupt;
reg[15:0] Din;
wire[3:0] Dout;
reg[15:0] ramAddress;
reg[7:0] ramDataIn;
wire[7:0] ramDataOut;
input readSignal,writeSignal;

reg[15:0] filterStartingOffset;
reg[15:0] denseStartingOffset;
// initiazlize coordiantor
coordinator coordiantor_module(clk,RST,interrupt,load,cnn,Din,Dout,ramAddress,ramDataIn,ramDataOut,readSignal,writeSignal);
integer compressed_image; 
integer  i,j;
initial begin

    


    // set RESET to 1 
    RST=1;
    #100 
    RST=0;
    // put filter size in first place in memory 
    ramAddress = 0;
    ramDataIn = filterSize;
    writeSignal = 1;
    #100 
    // put number of layers in second byte in memory 
    ramAddress = 1;
    ramDataIn = numberOfLayers;
    #100
    // calculate filter offset in ram 
    filterStartingOffset = 1+2*noOfFilterLayers;
    ramAddress = 2;
    ramDataIn = filterStartingOffset[15:8];
    #100 
    ramAddress = 3;
    ramDataIn = filterStartingOffset[7:0];
    #100 
    // write starting offset of dense
    denseStartingOffset = filterStartingOffset;
    i=0;
    repeat (numberOfLayers) begin
        denseStartingOffset = denseStartingOffset+noOfFilterLayers[i] + noOfFilterLayers[i]*filterSize*filterSize;
        i = i+1;
    end
    ramAddress = 4;
    ramDataIn = denseStartingOffset[15:8];
    #100 
    ramAddress = 5;
    ramDataIn = denseStartingOffset[7:0];
    #100 
    // write no of filters of each layer in memory 
    i=0;
    repeat (numberOfLayers) begin
        ramAddress = 6+i;
        ramDataIn = noOfFilterLayers[i];
        #100
        i = i+1;
    end
    // write no of dense of each layer in memory 
    i=0;
    repeat (numberOfLayers-1) begin
        ramAddress = 6+numberOfLayers+i;
        ramDataIn = noOfDenseLayers[i];
        #100
        i = i+1;
    end



    











    // read compressed binary image file line by line 
    // set load to 1 to load image/file 
    load = 1;
    // set cnn to 0 to load image
    cnn=0;
    compressed_image = $fopen("compressed.txt", "r");
    while (!$feof(compressed_image) ) begin
        // set Din to value corresponding to in1 and in2 
        $fscanf(compressed_image, "%b\n", Din);
        // add delay for 34 clockcycles
        #delayDecompress;
    end

    // set cnn to 1 to load cnn files

    // done loading can prcess now 
    load=0;
    $display("done loading\n");




end

endmodule;