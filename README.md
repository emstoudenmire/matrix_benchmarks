# Matrix Benchmarks

Collection of scripts and results for testing matrix operations with different BLAS implementations and on different platforms.


# Steps for Building the C++ Code

1. if the Makefile.default file already has the same ITensor folder as on your system, just make a soft link to it: `ln -s Makefile.default Makefile`

2. otherwise copy Makefile.default to your own copy (`cp Makefile.default Makefile.miles`), edit your copy, and make a soft link named `Makefile` as above
