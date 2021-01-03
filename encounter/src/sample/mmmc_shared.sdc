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


## You can use a separate file to keep options that are common between
## multiple modes. In this example we will assume that the output load 
## and input transition are the same.

set_input_transition 1.0 [get_ports *I]
set_load 0.02 [get_ports *O]

