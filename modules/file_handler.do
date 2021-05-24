vsim work.file_handler

add wave -position insertpoint  \
sim:/file_handler/load \
sim:/file_handler/clk \
sim:/file_handler/captured_data \
sim:/file_handler/tempramAddress \
sim:/file_handler/ramBase \
sim:/file_handler/write \
sim:/file_handler/sendByte 

force -freeze sim:/file_handler/clk 1 0, 0 {50ps} -r 100
force -freeze sim:/file_handler/load 1'd1 0
force -freeze sim:/file_handler/captured_data 16'b0000011101110111 0
force -freeze sim:/file_handler/ramBase 16'd15 0
run 100

force -freeze sim:/file_handler/captured_data 16'b0000011010011110 0
force -freeze sim:/file_handler/ramBase 16'd17 0
run 100

force -freeze sim:/file_handler/load 1'd0 0
force -freeze sim:/file_handler/captured_data 16'b0000011101110111 0
force -freeze sim:/file_handler/ramBase 16'd17 0
run 100

