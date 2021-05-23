module test_bench(clk);
parameter clockCycleTime = 100;
parameter delayDecompress = (clockCycleTime*34);
parameter numberOfLayers = 3;
parameter maxnumberOfLayers = 10;
parameter  filterSize = 5;

// starting from the last
parameter [8*(maxnumberOfLayers-1)-1:0] noOfFilterLayers  = {8'd10,8'd20,8'd30,8'd40,8'd50,8'd60,8'd70,8'd80,8'd90,8'd100}  ;
parameter [8*(maxnumberOfLayers-2)-1:0] noOfDenseLayers = {8'd10,8'd20,8'd30,8'd40,8'd50,8'd60,8'd70,8'd80,8'd90}  ;
input clk;
reg RST,load,cnn,interrupt;
reg[15:0] Din;
wire[3:0] Dout;
reg[15:0] ramAddress;
reg[7:0] ramDataIn;
wire[7:0] ramDataOut;
reg readSignal,writeSignal;

reg[15:0] filterStartingOffset;
reg[15:0] denseStartingOffset;
// initiazlize coordiantor
coordinator coordiantor_module(clk,RST,interrupt,load,cnn,Din,Dout,ramAddress,ramDataIn,ramDataOut,readSignal,writeSignal);
integer compressed_image,parameter_file; 
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
    filterStartingOffset = 2*numberOfLayers+5;
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
        denseStartingOffset = denseStartingOffset+noOfFilterLayers[8*i +: 8] + noOfFilterLayers[8*i +: 8]*filterSize*filterSize;
     
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
        ramDataIn = noOfFilterLayers[8*i +: 8];
        $display("accessing filters index %d value %d \n",i,noOfFilterLayers[8*i +: 8]);
        #100
        i = i+1;
    end
    // write no of dense of each layer in memory 
    i=0;
    repeat (numberOfLayers-1) begin
        ramAddress = 6+numberOfLayers+i;
        ramDataIn = noOfDenseLayers[8*i +: 8];
        $display("accessing dense index %d value %d \n",i,noOfDenseLayers[8*i +: 8]);
        #100
        i = i+1;
    end
    
    // read filter and bias files 
    writeSignal = 0;
    ramAddress = filterStartingOffset;
    load = 1;
    // set cnn to 1 to load file
    cnn=1;
    // layer 1
    parameter_file = $fopen("parameters/bin_filtersconv2d_1.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+1;
    end
    
    parameter_file = $fopen("parameters/bin_biasesconv2d_1.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+2;
    end
    

    // layer 2
    parameter_file = $fopen("parameters/bin_filtersconv2d_2.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+2;
    end
    parameter_file = $fopen("parameters/bin_biasesconv2d_2.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+2;
    end

    //layer 3
    parameter_file = $fopen("parameters/bin_filtersconv2d_3.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+2;
    end
    parameter_file = $fopen("parameters/bin_biasesconv2d_3.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+2;
    end

    // load dense 

    // layer 1
    parameter_file = $fopen("parameters/bin_biasesdense_1.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+2;
    end
    parameter_file = $fopen("parameters/bin_weightsdense_1.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+2;
    end

    // layer 2
    parameter_file = $fopen("parameters/bin_biasesdense_2.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+2;
    end
    parameter_file = $fopen("parameters/bin_weightsdense_2.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+2;
    end



    
    // done loading can prcess now 
    load=0;
    $display("done loading CNN Parameters \n");
    #100


    // read compressed binary image file line by line 
    // set load to 1 to load image/file 
    load = 1;
    // set cnn to 0 to load image
    cnn=0;
    ramAddress = ramAddress-1;
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
    $display("done loading image\n");




end

endmodule;