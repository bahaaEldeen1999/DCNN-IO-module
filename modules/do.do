vsim work.decompress
# vsim work.decompress 
# Start time: 22:10:33 on May 10,2021
# Loading work.decompress
add wave -position insertpoint  \
sim:/decompress/in1 \
sim:/decompress/in2 \
sim:/decompress/work \
sim:/decompress/byteIndx \
sim:/decompress/bitIndx \
sim:/decompress/rep \
sim:/decompress/rep2 \
sim:/decompress/currValue \
sim:/decompress/currValue2 \
sim:/decompress/tempOut \
sim:/decompress/out

force -freeze sim:/decompress/in1 10001000 0
force -freeze sim:/decompress/in2 00001000 0
force -freeze sim:/decompress/work 1 0

run 500