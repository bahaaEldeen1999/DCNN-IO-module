vsim -gui work.One_Bit_MUX
# vsim -gui work.One_Bit_MUX 
# Start time: 11:18:13 on May 25,2021
# Loading work.One_Bit_MUX
add wave -position insertpoint  \
sim:/One_Bit_MUX/File_Type \
sim:/One_Bit_MUX/OutSignal \
sim:/One_Bit_MUX/SignalCNN \
sim:/One_Bit_MUX/SignalDecompressed \
sim:/One_Bit_MUX/SignalFile \
sim:/One_Bit_MUX/SignalLayer \
sim:/One_Bit_MUX/Temp \
sim:/One_Bit_MUX/Write_Files \
sim:/One_Bit_MUX/Write_Layer
force -freeze sim:/One_Bit_MUX/File_Type 0 0
force -freeze sim:/One_Bit_MUX/SignalCNN 1 0
force -freeze sim:/One_Bit_MUX/SignalDecompressed 1 0
force -freeze sim:/One_Bit_MUX/SignalFile 1 0
force -freeze sim:/One_Bit_MUX/SignalLayer 1 0
force -freeze sim:/One_Bit_MUX/Write_Files 0 0
force -freeze sim:/One_Bit_MUX/Write_Layer 0 0
run 