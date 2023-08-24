transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Naheem/Documents/TEC/GitHub/njohnson_jmarschatz_gconejo_digital_design_lab_2023/Lab#2/Experimento2/oneBitFullAdder.vhd}
vcom -93 -work work {C:/Users/Naheem/Documents/TEC/GitHub/njohnson_jmarschatz_gconejo_digital_design_lab_2023/Lab#2/Experimento2/SevenSegCodec.vhd}
vcom -93 -work work {C:/Users/Naheem/Documents/TEC/GitHub/njohnson_jmarschatz_gconejo_digital_design_lab_2023/Lab#2/Experimento2/fourBitsFullAdder.vhd}

vcom -93 -work work {C:/Users/Naheem/Documents/TEC/GitHub/njohnson_jmarschatz_gconejo_digital_design_lab_2023/Lab#2/Experimento2/fourBitsFullAdder_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  fourBitsFullAdder_tb

add wave *
view structure
view signals
run -all
