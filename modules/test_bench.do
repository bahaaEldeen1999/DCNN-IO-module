vsim work.test_bench 

add wave -position insertpoint  \
sim:/test_bench/clk \
sim:/test_bench/RST \
sim:/test_bench/load \
sim:/test_bench/interrupt \
sim:/test_bench/Din \
sim:/test_bench/Dout

force -freeze sim:/test_bench/clk 1 0, 0 {50 ps} -r 100

run 100000000