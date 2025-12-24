#!/bin/bash
iverilog -g2012 -o sim test_bench/test_bench_controller.sv rtl/memory_controller.sv rtl/simple_memory.sv
vvp sim