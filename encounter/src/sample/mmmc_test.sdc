#################################################################
## Example MMMC SDC files
#################################################################
##
## There are 4 files in this fictional MMMC (multi-mode multi-corner)
## analysis setup:
##   - src/sample/mmmc_shared.sdc        SDC file with common constraints
##   - src/sample/mmmc_functional.sdc    Functional mode constraints
##   - src/sample/mmmc_test.sdc          Test mode constraints
##                                       (also used for hold timing analysis)
##   - src/sample/mmmc.view.tcl          Sample TCL file that can be adapted
##
## Please note these are just for reference, develop your own scripts!
##
#################################################################

## In our example, the test mode is projected to run much slower
create_clock -period  20 [get_ports {Clk_CI}]
set_propagated_clock [get_ports {Clk_CI}]

## for some reason I/O timing is different
set_input_delay  3 -clock {Clk_CI} [remove_from_collection [get_ports *I] [get_ports {Clk_CI}]]
set_output_delay 5 -clock {Clk_CI} [get_ports *O]

## In this mode, no case analysis should be set, to the fact that this mode is
## also used for hold timing analysis 

## note that the false paths from 'ScanEn_TI' and 'RamTest_TI' 
## in the functional mode are not declared here. But another path is
## disabled
