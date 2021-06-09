#
# Created by 
#   ../bin/Linux-x86_64-O/oasysGui 19.2-p002 on Wed May  5 23:11:34 2021
# (C) Mentor Graphics Corporation
#
set_units -time ns -capacitance ff -resistance kohm -power nW -voltage V -current mA
create_clock -period 60 -waveform {0 30} -name vsysclk 
group_path -name I2R -from [list [get_ports RST] [get_ports clk] [get_ports write_signal] [get_ports read_signal] [get_ports {data[0]}] [get_ports {data[1]}] [get_ports {data[2]}] [get_ports {data[3]}] [get_ports {data[4]}] [get_ports {data[5]}] [get_ports {data[6]}] [get_ports {data[7]}] [get_ports {data[8]}] [get_ports {data[9]}] [get_ports {data[10]}] [get_ports {data[11]}] [get_ports {data[12]}] [get_ports {data[13]}] [get_ports {data[14]}] [get_ports {data[15]}] [get_ports {address[0]}] [get_ports {address[1]}] [get_ports {address[2]}] [get_ports {address[3]}] [get_ports {address[4]}] [get_ports {address[5]}] [get_ports {address[6]}] [get_ports {address[7]}] [get_ports {address[8]}] [get_ports {address[9]}] [get_ports {address[10]}] [get_ports {address[11]}] [get_ports {address[12]}] [get_ports {address[13]}] [get_ports {address[14]}] [get_ports {address[15]}]]
group_path -name I2O -from [list [get_ports RST] [get_ports clk] [get_ports write_signal] [get_ports read_signal] [get_ports {data[0]}] [get_ports {data[1]}] [get_ports {data[2]}] [get_ports {data[3]}] [get_ports {data[4]}] [get_ports {data[5]}] [get_ports {data[6]}] [get_ports {data[7]}] [get_ports {data[8]}] [get_ports {data[9]}] [get_ports {data[10]}] [get_ports {data[11]}] [get_ports {data[12]}] [get_ports {data[13]}] [get_ports {data[14]}] [get_ports {data[15]}] [get_ports {address[0]}] [get_ports {address[1]}] [get_ports {address[2]}] [get_ports {address[3]}] [get_ports {address[4]}] [get_ports {address[5]}] [get_ports {address[6]}] [get_ports {address[7]}] [get_ports {address[8]}] [get_ports {address[9]}] [get_ports {address[10]}] [get_ports {address[11]}] [get_ports {address[12]}] [get_ports {address[13]}] [get_ports {address[14]}] [get_ports {address[15]}]]  -to [list [get_ports doneWrite] [get_ports doneRead] [get_ports {dataout[0]}] [get_ports {dataout[1]}] [get_ports {dataout[2]}] [get_ports {dataout[3]}] [get_ports {dataout[4]}] [get_ports {dataout[5]}] [get_ports {dataout[6]}] [get_ports {dataout[7]}] [get_ports {dataout[8]}] [get_ports {dataout[9]}] [get_ports {dataout[10]}] [get_ports {dataout[11]}] [get_ports {dataout[12]}] [get_ports {dataout[13]}] [get_ports {dataout[14]}] [get_ports {dataout[15]}]]
group_path -name R2O -to [list [get_ports doneWrite] [get_ports doneRead] [get_ports {dataout[0]}] [get_ports {dataout[1]}] [get_ports {dataout[2]}] [get_ports {dataout[3]}] [get_ports {dataout[4]}] [get_ports {dataout[5]}] [get_ports {dataout[6]}] [get_ports {dataout[7]}] [get_ports {dataout[8]}] [get_ports {dataout[9]}] [get_ports {dataout[10]}] [get_ports {dataout[11]}] [get_ports {dataout[12]}] [get_ports {dataout[13]}] [get_ports {dataout[14]}] [get_ports {dataout[15]}]]
set_load 10 [get_ports {dataout[15]}]
set_load 10 [get_ports {dataout[14]}]
set_load 10 [get_ports {dataout[13]}]
set_load 10 [get_ports {dataout[12]}]
set_load 10 [get_ports {dataout[11]}]
set_load 10 [get_ports {dataout[10]}]
set_load 10 [get_ports {dataout[9]}]
set_load 10 [get_ports {dataout[8]}]
set_load 10 [get_ports {dataout[7]}]
set_load 10 [get_ports {dataout[6]}]
set_load 10 [get_ports {dataout[5]}]
set_load 10 [get_ports {dataout[4]}]
set_load 10 [get_ports {dataout[3]}]
set_load 10 [get_ports {dataout[2]}]
set_load 10 [get_ports {dataout[1]}]
set_load 10 [get_ports {dataout[0]}]
set_load 10 [get_ports doneRead]
set_load 10 [get_ports doneWrite]
set_input_transition 0.1 [get_ports {address[15]}]
set_input_transition 0.1 [get_ports {address[14]}]
set_input_transition 0.1 [get_ports {address[13]}]
set_input_transition 0.1 [get_ports {address[12]}]
set_input_transition 0.1 [get_ports {address[11]}]
set_input_transition 0.1 [get_ports {address[10]}]
set_input_transition 0.1 [get_ports {address[9]}]
set_input_transition 0.1 [get_ports {address[8]}]
set_input_transition 0.1 [get_ports {address[7]}]
set_input_transition 0.1 [get_ports {address[6]}]
set_input_transition 0.1 [get_ports {address[5]}]
set_input_transition 0.1 [get_ports {address[4]}]
set_input_transition 0.1 [get_ports {address[3]}]
set_input_transition 0.1 [get_ports {address[2]}]
set_input_transition 0.1 [get_ports {address[1]}]
set_input_transition 0.1 [get_ports {address[0]}]
set_input_transition 0.1 [get_ports {data[15]}]
set_input_transition 0.1 [get_ports {data[14]}]
set_input_transition 0.1 [get_ports {data[13]}]
set_input_transition 0.1 [get_ports {data[12]}]
set_input_transition 0.1 [get_ports {data[11]}]
set_input_transition 0.1 [get_ports {data[10]}]
set_input_transition 0.1 [get_ports {data[9]}]
set_input_transition 0.1 [get_ports {data[8]}]
set_input_transition 0.1 [get_ports {data[7]}]
set_input_transition 0.1 [get_ports {data[6]}]
set_input_transition 0.1 [get_ports {data[5]}]
set_input_transition 0.1 [get_ports {data[4]}]
set_input_transition 0.1 [get_ports {data[3]}]
set_input_transition 0.1 [get_ports {data[2]}]
set_input_transition 0.1 [get_ports {data[1]}]
set_input_transition 0.1 [get_ports {data[0]}]
set_input_transition 0.1 [get_ports read_signal]
set_input_transition 0.1 [get_ports write_signal]
set_input_transition 0.1 [get_ports clk]
set_input_transition 0.1 [get_ports RST]
set_input_delay 0.7 [get_ports {address[15]}]
set_input_delay 0.7 [get_ports {address[14]}]
set_input_delay 0.7 [get_ports {address[13]}]
set_input_delay 0.7 [get_ports {address[12]}]
set_input_delay 0.7 [get_ports {address[11]}]
set_input_delay 0.7 [get_ports {address[10]}]
set_input_delay 0.7 [get_ports {address[9]}]
set_input_delay 0.7 [get_ports {address[8]}]
set_input_delay 0.7 [get_ports {address[7]}]
set_input_delay 0.7 [get_ports {address[6]}]
set_input_delay 0.7 [get_ports {address[5]}]
set_input_delay 0.7 [get_ports {address[4]}]
set_input_delay 0.7 [get_ports {address[3]}]
set_input_delay 0.7 [get_ports {address[2]}]
set_input_delay 0.7 [get_ports {address[1]}]
set_input_delay 0.7 [get_ports {address[0]}]
set_input_delay 0.7 [get_ports {data[15]}]
set_input_delay 0.7 [get_ports {data[14]}]
set_input_delay 0.7 [get_ports {data[13]}]
set_input_delay 0.7 [get_ports {data[12]}]
set_input_delay 0.7 [get_ports {data[11]}]
set_input_delay 0.7 [get_ports {data[10]}]
set_input_delay 0.7 [get_ports {data[9]}]
set_input_delay 0.7 [get_ports {data[8]}]
set_input_delay 0.7 [get_ports {data[7]}]
set_input_delay 0.7 [get_ports {data[6]}]
set_input_delay 0.7 [get_ports {data[5]}]
set_input_delay 0.7 [get_ports {data[4]}]
set_input_delay 0.7 [get_ports {data[3]}]
set_input_delay 0.7 [get_ports {data[2]}]
set_input_delay 0.7 [get_ports {data[1]}]
set_input_delay 0.7 [get_ports {data[0]}]
set_input_delay 0.7 [get_ports read_signal]
set_input_delay 0.7 [get_ports write_signal]
set_input_delay 0.7 [get_ports clk]
set_input_delay 0.7 [get_ports RST]
set_output_delay 18 -clock vsysclk [get_ports {dataout[15]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[14]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[13]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[12]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[11]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[10]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[9]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[8]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[7]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[6]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[5]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[4]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[3]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[2]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[1]}]
set_output_delay 18 -clock vsysclk [get_ports {dataout[0]}]
set_output_delay 18 -clock vsysclk [get_ports doneRead]
set_output_delay 18 -clock vsysclk [get_ports doneWrite]
set_operating_conditions  -library  [get_libs {NangateOpenCellLibrary}] -max  typical
