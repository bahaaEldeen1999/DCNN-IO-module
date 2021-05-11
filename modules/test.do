vsim work.decompress_handler

add wave -position insertpoint  \
sim:/decompress_handler/work

force -freeze sim:/decompress_handler/work 0 0
run 100 

force -freeze sim:/decompress_handler/work 1 0
run 100 


force -freeze sim:/decompress_handler/work 0 0
run 100 


force -freeze sim:/decompress_handler/work 1 0
run 100 

force -freeze sim:/decompress_handler/work 0 0
run 100 


force -freeze sim:/decompress_handler/work 1 0
run 100 


force -freeze sim:/decompress_handler/work 0 0
run 100 
