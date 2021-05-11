vsim work.DMA

add wave -position insertpoint  \
sim:/DMA/data \
sim:/DMA/dataout \
sim:/DMA/address \
sim:/DMA/read_signal \
sim:/DMA/write_signal 


force -freeze sim:/DMA/data 8'd2 0
force -freeze sim:/DMA/address 16'd1 0
force -freeze sim:/DMA/write_signal 1 0
run 500

force -freeze sim:/DMA/data 8'd1 0
force -freeze sim:/DMA/address 16'd0 0
force -freeze sim:/DMA/write_signal 1 0
run 500

force -freeze sim:/DMA/data 8'd3 0
force -freeze sim:/DMA/address 16'd2 0
force -freeze sim:/DMA/write_signal 1 0
run 500


force -freeze sim:/DMA/data 8'd4 0
force -freeze sim:/DMA/address 16'd3 0
force -freeze sim:/DMA/write_signal 1 0
run 500



force -freeze sim:/DMA/data 8'd5 0
force -freeze sim:/DMA/address 16'd4 0
force -freeze sim:/DMA/write_signal 1 0
run 500

force -freeze sim:/DMA/data 8'd6 0
force -freeze sim:/DMA/address 16'd5 0
force -freeze sim:/DMA/write_signal 1 0
run 500