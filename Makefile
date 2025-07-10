# Makefile for running Jupyter notebooks in Pipenv environment

# Name for the Jupyter kernel
KERNEL_NAME=python-dsa-notebooks

# Default target
.PHONY: run
run: install-kernel
	pipenv run jupyter notebook

# Install required packages and Jupyter kernel
.PHONY: setup
setup:
	pipenv install notebook matplotlib ipykernel numpy

# Register the kernel
.PHONY: install-kernel
install-kernel:
	pipenv run python -m ipykernel install --user --name=$(KERNEL_NAME)

# Clean up Jupyter checkpoint files
.PHONY: clean
clean:
	find . -name '*.ipynb_checkpoints' -type d -exec rm -rf {} +

# Remove Pipenv environment completely
.PHONY: uninstall
uninstall:
	pipenv --rm
