
# Define global variables
set DESIGN_NAME CEN598_HW2
set REPORTS_DIR reports
set RESULTS_DIR results

# Define design specific variables
set with_minPower 0
set with_lowPower 0
set with_saifAnnotations 0
#ultra flow mandatory for min power library
set use_compile_ultra 1
set hdlin_keep_signal_name user



# Create the require directory structure
file mkdir $REPORTS_DIR
file mkdir $RESULTS_DIR
#source the user specified dc_setup file
source "/afs/asu.edu/users/s/j/p/sjparekh/asap7_sagar/FPGA/HW2/DC_setup_28nm_0p85v.setup"
set hdlin_vrlg_std "2001"
# Read in the Synphony design verilog or vhdl
analyze -format verilog { SynLib.v}
analyze -format verilog CEN598_HW2.v


elaborate CEN598_HW2

# Post Elaborate analysis
write -hierarchy -format ddc -output ${RESULTS_DIR}/${DESIGN_NAME}.elab.ddc


# Read in Synphony constraint file
read_sdc CEN598_HW2_dc.sdc
if {$with_minPower == 1} {
	set synlibs {dw_foundation.sldb dw_minpower.sldb}
	# set up library variables
	set synthetic_library $synlibs
}

if {$with_lowPower == 1} {
	# Low power optimizations default options
	set_leakage_optimization true
	set_dynamic_optimization true
	set_max_area 0
	set compile_clock_gating_through_hierarchy true
	set power_driven_clock_gating true
	if {$with_minPower == 1} {
		set power_enable_datapath_gating true
	}
}

# Read and annotate activity data if available
if {$with_saifAnnotations == 1} {
	saif_map -start
	read_saif -auto_map_names -input ${DESIGN_NAME}.saif -instance test_${DESIGN_NAME}/i_${DESIGN_NAME} -verbose
}

# You can uncomment the lines below to use them.
#link 
#check_design > CEN598_HW2_check_design.log


#ungroup -flatten -all
# flatten it all, this forces all the hierarchy to be flattened out
#set_flatten true -effort high
#uniquify 


# This forces the compiler to spend as much effort (and time) 
# compiling this RTL to achieve timing possible. 
if {$use_compile_ultra == 1} {
	if {$with_lowPower == 1} {
		compile_ultra -gate_clock
	} else {
		compile_ultra
	}
} else {
	if {$with_lowPower == 1} {
		compile -map_effort medium -area_effort medium -gate_clock
	} else {
		compile -map_effort medium -area_effort medium
	}
}
# Now that the compile is complete report on the results 
report_area > ${REPORTS_DIR}/${DESIGN_NAME}.mapped.area.rpt
report_timing > ${REPORTS_DIR}/${DESIGN_NAME}.mapped.timing.rpt
report_qor > ${REPORTS_DIR}/${DESIGN_NAME}.mapped.qor.rpt
report_power > ${REPORTS_DIR}/${DESIGN_NAME}.mapped.power.rpt
report_clock_gating > ${REPORTS_DIR}/${DESIGN_NAME}.mapped.clock_gating.rpt
report_saif -hier -rtl_saif -missing > ${REPORTS_DIR}/${DESIGN_NAME}.mapped.saif.rpt

# Write the optimized and compiled design. This can be used for further optimizations. 
write -hierarchy -format ddc  ${DESIGN_NAME} -output ${RESULTS_DIR}/${DESIGN_NAME}.mapped.ddc

# Finally write the post synthesis netlist out to a verilog file 
write -f verilog  ${DESIGN_NAME} -output ${RESULTS_DIR}/${DESIGN_NAME}_post_synth.v -hierarchy
