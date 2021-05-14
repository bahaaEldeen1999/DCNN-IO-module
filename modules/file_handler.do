vsim work.file_handler

add wave -position insertpoint  \
sim:/file_handler/load \
sim:/file_handler/clk \
sim:/file_handler/captured_data

force -freeze sim:/file_handler/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/file_handler/load 1'd1 0
run 1000