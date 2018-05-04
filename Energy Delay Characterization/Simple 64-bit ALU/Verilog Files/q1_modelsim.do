# To execute this do-file, use the following ModelSim command:
# vsim  < q1_modelsim.do
vlib shlslib
vmap work shlslib
vlog "SynLib.v"

vlib q1_modelsim
vmap work q1_modelsim

vlog "q1.v" "q1_Test.v"
vsim -t ns -L shlslib test_q1
run -all
