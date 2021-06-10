vsim -gui work.mux16_test_bench
add wave -position insertpoint  \
sim:/mux16_test_bench/Load \
sim:/mux16_test_bench/Image \
sim:/mux16_test_bench/Layer \
sim:/mux16_test_bench/AddressInDecompressed \
sim:/mux16_test_bench/AddressInFile \
sim:/mux16_test_bench/AddressInCNN \
sim:/mux16_test_bench/AddressLayerInput \
sim:/mux16_test_bench/AddressToRAM
run
run
run
run