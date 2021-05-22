vsim work.cpu
add wave -position insertpoint  \
sim:/cpu/clk \
sim:/cpu/RST \
sim:/cpu/interrupt \
sim:/cpu/load \
sim:/cpu/cnn \
sim:/cpu/i \
sim:/cpu/isLoading \
sim:/cpu/in1 \
sim:/cpu/in2 \
sim:/cpu/ramDataIn \
sim:/cpu/ramDataOut \
sim:/cpu/byteIndx \
sim:/cpu/bitIndx \
sim:/cpu/newByteIndx \
sim:/cpu/newBitIndx \
sim:/cpu/doneDecompressHandler \
sim:/cpu/tempWork \
sim:/cpu/tempWorking \
sim:/cpu/ramReadSignal \
sim:/cpu/ramWriteSignal \
sim:/cpu/ramDoneRead \
sim:/cpu/ramDoneWrite \
sim:/cpu/ramAddress

force -freeze sim:/cpu/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/cpu/RST 1'd1 0
run 100

force -freeze sim:/cpu/RST 1'd0 0
force -freeze sim:/cpu/tempWorking 1'd0 0
run 100

force -freeze sim:/cpu/in1 00000111 0
force -freeze sim:/cpu/in2 10000011 0
force -freeze sim:/cpu/tempWorking 1 0
force -freeze sim:/cpu/byteIndx 32'd0 0
force -freeze sim:/cpu/bitIndx 3'd7 0

run 6000 

force -freeze sim:/cpu/in1 00000111 0
force -freeze sim:/cpu/in2 10000011 0
force -freeze sim:/cpu/tempWorking 1 0
force -freeze sim:/cpu/byteIndx 32'd1 0
force -freeze sim:/cpu/bitIndx 3'd5 0

run 6000

