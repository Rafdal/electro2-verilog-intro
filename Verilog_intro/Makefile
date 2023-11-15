VERILOGS=$(wildcard *.v)

adder_tb.vcd: $(VERILOGS)
	verilator --lint-only $(VERILOGS) --trace --timing
	iverilog $(VERILOGS)
	./a.out

clean: rm -f a.out *.vcd