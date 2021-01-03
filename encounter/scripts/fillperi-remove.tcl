###########################################################################
#  Title      : remove io filler cells
#  Project    : gf 28 dz flow
##########################################################################
#  File       : fillperi-remove.tcl
#  Author     : Beat Muheim  <muheim@ee.ethz.ch>
#  Company    : Microelectronics Design Center (DZ), ETH Zurich
#  Created    : 2015-07-16
#  Last update: 2015-07-16
##########################################################################
#  Description : remove the io filler cells.
#  Inputs      : 
#  Outputs     :
#  Resources   :
##########################################################################
#  Copyright (c) 2015 Microelectronics Design Center, ETH Zurich
##########################################################################
# v0.1  - <muheim@ee.ethz.ch> - Thu Jul 16 17:29:20 CEST 2015
#  - copy from umcL65 adapt it
##########################################################################

deleteIoFiller -cell PFILL10_18_18_NT_DR
deleteIoFiller -cell PFILL5_18_18_NT_DR
deleteIoFiller -cell PFILL2_18_18_NT_DR
deleteIoFiller -cell PFILL1NC_18_18_NT_DR
deleteIoFiller -cell PFILL1NC_18_18_NT_DR
redraw
