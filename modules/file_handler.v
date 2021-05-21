module file_handler(load,clk);
input load;// determine to load file or not 
input clk;
integer               data_file    ; // file handler
integer               scan_file    ; // file handler
reg[15:0] captured_data;
`define NULL 0    

initial begin
  data_file = $fopen("bin.txt", "r");
  if (data_file == `NULL) begin
    $display("data_file handle was NULL");
    $finish;
  end
end

always @(posedge clk,load) begin
    if (load == 1) begin
        
        scan_file = $fscanf(data_file, "%b\n", captured_data); 
        if (!$feof(data_file)) begin
            //use captured_data as you would any other wire or reg value;
            $display("line %b",captured_data);
        end
    end
end
endmodule;