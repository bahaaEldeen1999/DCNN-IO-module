module test_bench(clk);
parameter clockCycleTime = 100;
parameter delayDecompress = (clockCycleTime*34);
parameter numberOfLayers = 3;
input clk;
reg RST,load,cnn,interrupt;
reg[15:0] Din;
wire[3:0] Dout;
reg[15:0] layerIndx;
reg[2:0] layerType;
// initiazlize coordiantor
coordinator coordiantor_module(clk,RST,interrupt,load,cnn,Din,Dout,layerIndex,layerType);
integer compressed_image; 
integer  i,j;
initial begin

    // set RESET to 1 
    RST=1;
    #100 
    RST=0;
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
    // for now set a hight delay but we should be notified from the coordinator that a file finished loading 
    cnn = 1;
    // load files of layers 
    // first load the layer biased
    layerType = 4;
    layerIndx=1;
    // for all remaining types loop 3 time for each type 
    i = 1;
    repeat (numberOfLayers) begin
        j=1;
        repeat (3) begin 
            layerIndx=i;
            layerType=j;
            // add delay to make sure file is read 
            #1000
            j=j+1;
        end
        i=i+1;
    end

    // done loading can prcess now 
    load=0;
    $display("done loading\n");




end

endmodule;