vsim work.coordinator
add wave -position insertpoint  \
sim:/coordinator/clk \
sim:/coordinator/RST \
sim:/coordinator/interrupt \
sim:/coordinator/load \
sim:/coordinator/cnn \
sim:/coordinator/i \
sim:/coordinator/isLoading \
sim:/coordinator/in1 \
sim:/coordinator/in2 \
sim:/coordinator/ramDataIn \
sim:/coordinator/ramDataOut \
sim:/coordinator/byteIndx \
sim:/coordinator/bitIndx \
sim:/coordinator/newByteIndx \
sim:/coordinator/newBitIndx \
sim:/coordinator/doneDecompressHandler \
sim:/coordinator/tempWork \
sim:/coordinator/tempWorking \
sim:/coordinator/ramReadSignal \
sim:/coordinator/ramWriteSignal \
sim:/coordinator/ramDoneRead \
sim:/coordinator/ramDoneWrite \
sim:/coordinator/ramAddress

force -freeze sim:/coordinator/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/coordinator/RST 1'd1 0
run 100

force -freeze sim:/coordinator/RST 1'd0 0
force -freeze sim:/coordinator/tempWorking 1'd0 0
run 100

force -freeze sim:/coordinator/in1 00000111 0
force -freeze sim:/coordinator/in2 10000011 0
force -freeze sim:/coordinator/tempWorking 1 0
force -freeze sim:/coordinator/byteIndx 32'd0 0
force -freeze sim:/coordinator/bitIndx 3'd7 0

run 6000 

force -freeze sim:/coordinator/in1 00000111 0
force -freeze sim:/coordinator/in2 10000011 0
force -freeze sim:/coordinator/tempWorking 1 0
force -freeze sim:/coordinator/byteIndx 32'd1 0
force -freeze sim:/coordinator/bitIndx 3'd5 0

run 6000

