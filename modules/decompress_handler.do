vsim work.decompress_handler

add wave -position insertpoint  \
sim:/decompress_handler/in1 \
sim:/decompress_handler/in2 \
sim:/decompress_handler/byteIndx \
sim:/decompress_handler/bitIndx \
sim:/decompress_handler/ramAddress \
sim:/decompress_handler/ramDataOut \
sim:/decompress_handler/ramData \
sim:/decompress_handler/write_signal \
sim:/decompress_handler/shift \
sim:/decompress_handler/byteIndxTemp \
sim:/decompress_handler/bitIndxTemp \
sim:/decompress_handler/tempNewBitIndx \
sim:/decompress_handler/tempNewByteIndx \
sim:/decompress_handler/i \
sim:/decompress_handler/doneSignal \
sim:/decompress_handler/work \
sim:/decompress_handler/buffer \
sim:/decompress_handler/breakLoop


force -freeze sim:/decompress_handler/in1 00000011 0
force -freeze sim:/decompress_handler/in2 010110111 0
force -freeze sim:/decompress_handler/work 0 0
force -freeze sim:/decompress_handler/byteIndx 32'd0 0
force -freeze sim:/decompress_handler/bitIndx 3'd7 0

run 6500


force -freeze sim:/decompress_handler/in1 10000011 0
force -freeze sim:/decompress_handler/in2 010110111 0
force -freeze sim:/decompress_handler/work 1 0
force -freeze sim:/decompress_handler/byteIndx 32'd0 0
force -freeze sim:/decompress_handler/bitIndx 3'd4 0

run 6500


force -freeze sim:/decompress_handler/in1 00000011 0
force -freeze sim:/decompress_handler/in2 010110111 0
force -freeze sim:/decompress_handler/work 0 0
force -freeze sim:/decompress_handler/byteIndx 32'd0 0
force -freeze sim:/decompress_handler/bitIndx 3'd1 0

run 6500



force -freeze sim:/decompress_handler/in1 10000010 0
force -freeze sim:/decompress_handler/in2 010110111 0
force -freeze sim:/decompress_handler/work 1 0
force -freeze sim:/decompress_handler/byteIndx 32'd1 0
force -freeze sim:/decompress_handler/bitIndx 3'd6 0

run 6500










