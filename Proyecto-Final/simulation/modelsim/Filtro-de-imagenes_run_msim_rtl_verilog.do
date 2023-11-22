transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Naheem/Documents/TEC/GitHub/njohnson_jmarschatz_gconejo_digital_design_lab_2023/Proyecto-Final/Modulos/Procesador {C:/Users/Naheem/Documents/TEC/GitHub/njohnson_jmarschatz_gconejo_digital_design_lab_2023/Proyecto-Final/Modulos/Procesador/AluAritmetic.sv}
vlog -sv -work work +incdir+C:/Users/Naheem/Documents/TEC/GitHub/njohnson_jmarschatz_gconejo_digital_design_lab_2023/Proyecto-Final/Modulos/Procesador {C:/Users/Naheem/Documents/TEC/GitHub/njohnson_jmarschatz_gconejo_digital_design_lab_2023/Proyecto-Final/Modulos/Procesador/alu.sv}

vlog -sv -work work +incdir+C:/Users/Naheem/Documents/TEC/GitHub/njohnson_jmarschatz_gconejo_digital_design_lab_2023/Proyecto-Final/Modulos/Procesador {C:/Users/Naheem/Documents/TEC/GitHub/njohnson_jmarschatz_gconejo_digital_design_lab_2023/Proyecto-Final/Modulos/Procesador/ALU_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ALU_tb

add wave *
view structure
view signals
run -all
