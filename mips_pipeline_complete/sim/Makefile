.PHONY: help clean libs optimize cli_run gui_run cli debug build 

# Project specific bench:
# Directory where bench specific code is located.
# This variable allows for project_benches to reside independent of verification IP and UVMF release directories.
# For examples deployed with UVMF this will be $(UVMF_HOME)/<example_group>/project_benches/<example_bench>
export PROJECT_DIR ?= $(PWD)/..

TEST_NAME=test_pipeline_main


VERILOG_DUT = \
+incdir+$(PROJECT_DIR)/rtl \
$(PROJECT_DIR)/rtl/*


TEST_BENCH_HDL = \
+incdir+$(PROJECT_DIR)/rtl \
$(PROJECT_DIR)/tb/testbench/tb.sv

TOP_TB= tb

DEBUG_DO_COMMANDS = -do "wave.do" -do "run -all" 
BATCH_DO_COMMANDS = -do "run -all" 

default: help

cpy_inst_data_mem : 
	cp ../../sw/$(TEST_NAME)/$(TEST_NAME)_inst.bin ./instructionmemory.txt
	cp ../../sw/$(TEST_NAME)/$(TEST_NAME)_data.bin ./datamemory.txt


libs:
	test -e work || vlib work 


comp_verilog_dut: 
	echo "Compile your verilog DUT here"
	vlog -sv $(VERILOG_DUT)


# Top Test Bench Modules
hdl_comp_testbench:
	vlog -sv $(TEST_BENCH_HDL)


comp_test_bench: hdl_comp_testbench


build: comp_verilog_dut comp_test_bench  



# Optimize target - For Classic run vopt twice.. one for batch mode (high performance, low visibility) and
#   one for debug mode (full visibility).  Doing it twice here allows the gui_run and cli_run
#   targets to be run at the user's convenience later on without reoptimizing.  Also utilized
#   by VRM's rerun capabilities
#   For Visualizer, only run vopt once (always with -debug)
optimize:
	vopt  $(TOP_TB) -o optimized_batch_top_tb
	vopt  $(TOP_TB) +acc -o optimized_debug_top_tb




# Invoke a GUI mode simulation
gui_run: 
	vsim -i optimized_debug_top_tb $(DEBUG_DO_COMMANDS)

# Invoke a batch mode simulation
cli_run: 
	vsim -c optimized_batch_top_tb  $(BATCH_DO_COMMANDS)



cli: clean cpy_inst_data_mem libs build optimize cli_run
debug gui: clean cpy_inst_data_mem libs build optimize gui_run


# Common targets
help:
	@echo "The following make targets are available:"
	@echo "   clean:              Delete work library, generated files, log files, etc."
	@echo "   debug or gui:       Build and run the default test in the GUI"
	@echo "   cli:                Build and run the default test in command-line mode"
	@echo "   The following switches can be added to the above commands:"
	@echo "      TEST_NAME=<testname> to run a different test than the default, which is test_top"

clean::
	@-rm -rfv *~ *.ucdb vsim.dbg *.vstf *.log work *.mem *.transcript.txt certe_dump.xml *.wlf transcript covhtmlreport VRMDATA
	@-rm -rfv design.bin qwave.db dpiheader.h visualizer*.ses vrmhtmlreport
	@-rm -rfv veloce.med veloce.wave tbxbindings.h edsenv
	@-rm -rfv sv_connect.*
	@-rm -rfv *.o *.so
	@-rm -rfv covercheck_results
	@-rm -rfv qrun.out *.qf *.vf
	@-rm -rfv .visualizer