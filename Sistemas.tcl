# Copyright (C) 2019  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: Sistemas.tcl
# Generated on: Sat Oct 08 11:33:23 2022

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "Sistemas"]} {
		puts "Project Sistemas is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists Sistemas]} {
		project_open -revision Sistemas Sistemas
	} else {
		project_new -revision Sistemas Sistemas
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone IV E"
	set_global_assignment -name DEVICE auto
	set_global_assignment -name TOP_LEVEL_ENTITY GrayEncoder
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 19.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "13:04:29  OCTOBER 01, 2022"
	set_global_assignment -name LAST_QUARTUS_VERSION "19.1.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim-Altera (VHDL)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT VHDL -section_id eda_simulation
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_timing
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_symbol
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_signal_integrity
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_boundary_scan
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_simulation
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name VHDL_FILE src/ULA.vhd
	set_global_assignment -name VHDL_FILE src/Sistemas.vhd
	set_global_assignment -name VHDL_FILE src/RegisterN.vhd
	set_global_assignment -name VHDL_FILE src/AdderSubtractor.vhd
	set_global_assignment -name VHDL_FILE src/BinaryCounter.vhd
	set_global_assignment -name VHDL_FILE src/GenericAdder.vhd
	set_global_assignment -name VHDL_FILE src/FullAdder.vhd
	set_global_assignment -name VHDL_FILE src/GrayEncoder.vhd
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
