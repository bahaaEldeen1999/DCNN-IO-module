vsim -gui work.decompress_test_bench
add wave -position insertpoint  \
sim:/decompress_test_bench/in1 \
sim:/decompress_test_bench/in2 \
sim:/decompress_test_bench/work \
sim:/decompress_test_bench/done \
sim:/decompress_test_bench/out \
sim:/decompress_test_bench/byteIndx \
sim:/decompress_test_bench/bitIndx
run
run
run