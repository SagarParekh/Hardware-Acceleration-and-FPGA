define_clock {p:clk} -period 0.961 -clockgroup default_dsp_clkgroup
# Do not pack registers in IO pads
# This will be relevant if designer inserts IO
define_global_attribute syn_useioff {0}