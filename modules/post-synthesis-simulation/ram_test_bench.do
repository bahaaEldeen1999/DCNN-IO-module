vsim -gui work.ram_test_bench
add wave -position insertpoint  \
sim:/ram_test_bench/clk \
sim:/ram_test_bench/read_signal \
sim:/ram_test_bench/write_signal \
sim:/ram_test_bench/RST \
sim:/ram_test_bench/data \
sim:/ram_test_bench/address \
sim:/ram_test_bench/dataout \
sim:/ram_test_bench/doneRead \
sim:/ram_test_bench/doneWrite
force -freeze sim:/ram_test_bench/clk 1 0, 0 {50 ps} -r 100
run
run
run
run
run
