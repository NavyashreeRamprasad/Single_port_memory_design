vlib work
vlog mem_tb.v
vsim -novopt -suppress 12110 tb
#add wave -position insertpoint sim:/tb/*
do wave.do
run -all

#data_array[0] = 49
# data_array[1] = 44
# data_array[2] = 23
# data_array[3] = 45
# data_array[4] = 34
# data_array[5] = 32
# data_array[6] = 45
# data_array[7] = 46
# data_array[8] = 30
# data_array[9] = 27

