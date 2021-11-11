.PHONY: run_icarus
run_icarus:
	make -C tests/cocotb SIM=icarus

.PHONY: run_questa
run_questa:
	make -C examples/TinyALU SIM=questa

.PHONY: run_vcs
run_vcs:
	make -C examples/TinyALU SIM=vcs

.PHONY: init
init:
	pip install -r requirements.txt
	pip install -e .

.PHONY: test
test:
	pytest tests/pytests
