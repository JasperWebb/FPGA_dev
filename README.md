# FPGA_dev
Some FPGA_dev


## Some things for me to remember:
* Start new project by making new folder and copying over from Makefile, ice40.pcf, top.sv
* Build with `make` and deploy it to the pico-ice with `make prog`, and `make gateware.uf2` to generate an
[uf2 image](https://pico-ice.tinyvision.ai/programming_the_fpga.html#using-a-drag-drop-or-file-copy-scheme)
to program with drag-and-drop.
* If you drag and drop the .uf2 Mac osx Sonoma will pop up with "The Finder can’t complete the operation because some data in “gateware.uf2” can’t be read or written.
(Error code -36)"  This can be ignored and the pico-ice fpga should be flashed. 
