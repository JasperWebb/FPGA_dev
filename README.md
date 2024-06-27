# FPGA_dev
Some FPGA_dev


## Some things for me to remember:
* Start new project by making new folder and copying over from Makefile, ice40.pcf, top.sv
* To build, cd to folder and run <code>make</code>, or <code>make gateware.uf2</code>,
* Writing uf2 to pico-ice: drag and drop .uf2 file onto pico-ice drive icon or run <code>cp /file/path/gateware.uf2 /Volumes/pico-ice</code> in the terminal window
* If you drag and drop the uf2 Mac osx Sonoma will pop up with "The Finder can’t complete the operation because some data in “gateware.uf2” can’t be read or written.
(Error code -36)"  This can be ignored and the pico-ice fpga should be flashed. 
