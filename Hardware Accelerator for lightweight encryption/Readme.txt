Golden Run:
For the following design:
Key: 0x1918 1110 0908 0100
PlainText: 0x6565 6877
CipherText: 0xc69b e9bb (50843 59835) Look for these values in Xi1 and Xi (Workspace)

Files:

1. Base line model – baseline_model.slx
Before running this .slx file run the test bench baseline_testbench.m
Output will be obtained for 34 cycles.(32+ portin and portout delay).

2. Internal Pipelined model: internal_pipelined_interleaved_model.slx
Before running this .slx file run the test bench -- internal_pipelined_interleaved_tesbench.m
Output will be obtained for 34 cycles.(32+ portin and portout delay).

3. Unrolled by a factor of 4: loop_unrolling_4_model.slx
Testbench – loop_unrolling_4_testbench.m
4 Outputs will be obtained after (32+2) cycles.

4. Completely unfolded - pipelined_model.slx
Testbench – pipelined_testbench.m
Latency – 34 cycles
Output will be continuously seen after 34 cycles

5. Spatial parallelism – pipelined_and_spatial_parallelism_model.slx
Testbench – pipelined_and_spatial_parallelism_testbench.m
Latency – 34 cycles (Look for four workspace outputs)
Output will be continuously seen after 34 cycles
