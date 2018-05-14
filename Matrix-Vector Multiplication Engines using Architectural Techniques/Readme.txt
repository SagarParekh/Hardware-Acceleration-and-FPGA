Matrix-vector multiplication (MVM) is one of the most basic operations of many DSP algorithms.In this assignment, you will design several MVM engines with different architectures to achieve a target throughput. The objective is to explore the energy-area trade-off using architectural techniques.

Assuming 𝑨 ∈ ℝ^(64×64) is a square matrix with 64 rows and columns, respectively, and 𝑥 ∈ ℝ^64 is a 64 dimensional vector,the multiplication of 𝑦=𝑨𝑥 can be computed in a column-wise fashion.

As shown in equation 1, the basic operation needed for computing each 𝑦𝑖 is multiply-accumulate (MAC) operation, and the computations of different 𝑦𝑖 can be parallelized due to the data concurrency.

A basic processing element (PE) for MAC operation is given in Fig. 1, where p1, p2, and, p3 is the latency of the pipeline register inside the multiplier, the adder, and the feedback loop, respectively. p1 and p2 should be specified as the internal latency in the adder and multiplier block, respectively.
