onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {GLOBAL SIGNALS} /tb/clk_i
add wave -noupdate -expand -group {GLOBAL SIGNALS} /tb/rst_i
add wave -noupdate -expand -group {CONTROL SIGNALS} /tb/valid_i
add wave -noupdate -expand -group {CONTROL SIGNALS} /tb/wr_rd_i
add wave -noupdate -expand -group {CONTROL SIGNALS} /tb/ready_o
add wave -noupdate -expand -group ADDRESS -radix unsigned /tb/addr_i
add wave -noupdate -expand -group {DATA SIGNALS} -radix unsigned /tb/wdata_i
add wave -noupdate -expand -group {DATA SIGNALS} /tb/rdata_o
add wave -noupdate -group {DUT MEMORY} /tb/dut/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {74 ns}
