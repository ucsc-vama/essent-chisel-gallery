# Example Integrations With ESSENT

This repo provides examples of how [ESSENT](https://github.com/ucsc-vama/essent) can be used to simulate existing projects. We continue to add more examples and welcome contributions.


## riscv-mini
[riscv-mini](https://github.com/ucb-bar/riscv-mini) is a 3-stage RISC-V processor implemented in Chisel.

To integrate with ESSENT, only the main harness (`top.cc`) needed to be modified. To build the emulator:

    $ cd riscv-mini
    $ make emulator

To run a microbenchmark to see it works:

    $ make test


## Rocket Chip
Since [Rocket Chip](https://github.com/chipsalliance/rocket-chip) is an important Chisel project but requires a code to interface, we release our example integration as a separate repo for it: https://github.com/ucsc-vama/essent-rocket-demo


## Integrations in Progress
+ [dinocpu](https://github.com/jlpteaching/dinocpu)
