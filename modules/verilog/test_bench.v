module test_bench(clk);
parameter clockCycleTime = 100;
parameter delayDecompress = (clockCycleTime*34);
parameter numberOfLayers = 5;
parameter numberOfLayersDense = 2;
parameter maxnumberOfLayers = 10;
parameter  filterSize = 5;

// starting from the last
parameter [16*(maxnumberOfLayers-1)-1:0] noOfFilterLayers  = {16'd10,16'd20,16'd30,16'd40,16'd50,16'd1920,16'd0,16'd96,16'd0,16'd6}  ;
parameter [16*(maxnumberOfLayers-1)-1:0] typeOfFilterLayers  = {16'd10,16'd20,16'd30,16'd40,16'd50,16'd0,16'd1,16'd0,16'd1,16'd0}  ;
parameter [16*(maxnumberOfLayers-2)-1:0] noOfDenseLayers = {16'd10,16'd20,16'd30,16'd40,16'd50,16'd60,16'd6,16'd10,16'd84}  ;
parameter [16*(maxnumberOfLayers-2)-1:0] noOfWrightLayers = {16'd10,16'd20,16'd30,16'd40,16'd50,16'd60,16'd6,16'd840,16'd10080}  ;
input clk;
reg RST,load,cnn,interrupt;
reg[15:0] Din;
wire[3:0] Dout;
reg[15:0] ramAddress;
reg[15:0] ramDataIn;
wire[15:0] ramDataOut;
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
    $display("writeSignal %d\n",writeSignal);
    #100 
    // put number of layers in second byte in memory 
    ramAddress = 1;
    ramDataIn = numberOfLayers;
    #100
    // calculate filter offset in ram 
    filterStartingOffset = 4+2*numberOfLayers+2*numberOfLayersDense;
    ramAddress = 2;
    ramDataIn = filterStartingOffset;
    #100 
    // write starting offset of dense
    denseStartingOffset = filterStartingOffset;
    $display("filterStartingOffset  %d\n",filterStartingOffset);

    i=0;
    repeat (numberOfLayers) begin
        denseStartingOffset = denseStartingOffset+noOfFilterLayers[16*i +: 16] + noOfFilterLayers[16*i +: 16]*filterSize*filterSize;
     $display("noOfFilterLayers %d\n",noOfFilterLayers[16*i +: 16]);
        i = i+1;
    end
    ramAddress = 3;
    ramDataIn = denseStartingOffset;
    #100 
    $display("denseStartingOffset  %d\n",denseStartingOffset);
    // write no of filters of each layer in memory 
    i=0;
    repeat (numberOfLayers) begin
        ramAddress = ramAddress+1;
        ramDataIn = noOfFilterLayers[16*i +: 16];
        $display("accessing filters index %d value %d \n",i,noOfFilterLayers[16*i +: 16]);
        #100
        i = i+1;
    end
    // write types of filters 
    i=0;
    repeat (numberOfLayers) begin
        ramAddress = ramAddress+1;
        ramDataIn = typeOfFilterLayers[16*i +: 16];
        $display("accessing filters index %d value %d \n",i,noOfFilterLayers[16*i +: 16]);
        #100
        i = i+1;
    end
    // write no of dense of each layer in memory and weights
    i=0;
    repeat (numberOfLayersDense) begin
        ramAddress = ramAddress+1;
        ramDataIn = noOfDenseLayers[16*i +: 16];
        $display("accessing dense index %d value %d \n",i,noOfDenseLayers[16*i +: 16]);
        #100
         ramAddress = ramAddress+1;
        ramDataIn = noOfWrightLayers[16*i +: 16];
        $display("accessing wight index %d value %d \n",i,noOfWrightLayers[16*i +: 16]);
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
        ramAddress = ramAddress+1;
    end
    

    // layer 2
    parameter_file = $fopen("parameters/bin_filtersconv2d_2.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+1;
    end
    parameter_file = $fopen("parameters/bin_biasesconv2d_2.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+1;
    end

    //layer 3
    parameter_file = $fopen("parameters/bin_filtersconv2d_3.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+1;
    end
    parameter_file = $fopen("parameters/bin_biasesconv2d_3.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+1;
    end

    // load dense 

    // layer 1
    parameter_file = $fopen("parameters/bin_biasesdense_1.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+1;
    end
    parameter_file = $fopen("parameters/bin_weightsdense_1.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+1;
    end

    // layer 2
    parameter_file = $fopen("parameters/bin_biasesdense_2.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+1;
    end
    parameter_file = $fopen("parameters/bin_weightsdense_2.txt", "r");
    while (!$feof(parameter_file) ) begin
        $fscanf(parameter_file, "%b\n", Din);
        #200;
        ramAddress = ramAddress+1;
    end



    #100
    // done loading can prcess now 
    load=0;
    $display("done loading CNN Parameters \n");
    #100


    // read compressed binary image file line by line 
    // set load to 1 to load image/file 
    load = 1;
    // set cnn to 0 to load image
    cnn=0;
    // ramAddress = ramAddress-1;
    $display(" ramAddress %d\n",ramAddress);
    compressed_image = $fopen("compressed.txt", "r");
    i=0;
    while (!$feof(compressed_image) ) begin
        // set Din to value corresponding to in1 and in2 
        $fscanf(compressed_image, "%b\n", Din);
        // add delay for 34 clockcycles
        #delayDecompress;
        i=i+1;
    end
    #100
    // set cnn to 1 to load cnn files

    // done loading can prcess now 
    load=0;
    $display("done loading image  \n");




end

endmodule;
