vsim -gui work.MUX
add wave -position insertpoint  \
sim:/MUX/DataInCNN \
sim:/MUX/DataInDecompressed \
sim:/MUX/DataInFile \
sim:/MUX/Image \
sim:/MUX/Layer \
sim:/MUX/LayerInput \
sim:/MUX/Load \
sim:/MUX/Temp \
sim:/MUX/ToRAM
force -freeze sim:/MUX/Load 0 0
force -freeze sim:/MUX/Layer 0 0
force -freeze sim:/MUX/Image 0 0
force -freeze sim:/MUX/DataInCNN 11111000 0
force -freeze sim:/MUX/DataInDecompressed 11111100 0
force -freeze sim:/MUX/DataInFile 11111110 0
force -freeze sim:/MUX/LayerInput 11111111 0
run
force -freeze sim:/MUX/Load 1 0
run


