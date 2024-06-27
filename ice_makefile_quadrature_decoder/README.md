# ice_makefile_quadrature_decoder

Example project using a standard [Makefile](https://en.wikipedia.org/wiki/Make_%28software%29)
to build a project that can be loaded onto the board.

It needs [oss-cad-suite](https://github.com/YosysHQ/oss-cad-suite-build) installed.
See the [doc](https://pico-ice.tinyvision.ai/using_oss_cad_suite.html) for more.

Build with `make` and deploy it to the pico-ice with `make prog`, and `make gateware.uf2` to generate an
[uf2 image](https://pico-ice.tinyvision.ai/programming_the_fpga.html#using-a-drag-drop-or-file-copy-scheme)
to program with drag-and-drop.

Decodes simple AB encoder, lights up onboard LED to indicated direction of rotation. Green for clockwise and red for counter clockwise. Blue is supposed to light up to indicate full rotation (600 pulses) but need to work to lengthen pulse as it currently lasts just one clock cycle. 
