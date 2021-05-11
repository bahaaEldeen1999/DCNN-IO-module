vsim work.decompress
# vsim work.decompress 
# Start time: 22:10:33 on May 10,2021
# Loading work.decompress
add wave -position insertpoint  \
sim:/decompress/in1 \
sim:/decompress/i \
sim:/decompress/j \
sim:/decompress/rep \
sim:/decompress/currValue \
sim:/decompress/temp \
sim:/decompress/byteIndx \
sim:/decompress/bitIndx \
sim:/decompress/out

force -freeze sim:/decompress/in1 10110111 0

run 500