###########################################################################
#  Title      : insert io filler cells
#  Project    : gf 28 dz flow
##########################################################################
#  File       : fillperi-insert.tcl 
#  Author     : Beat Muheim  <muheim@ee.ethz.ch>
#  Company    : Microelectronics Design Center (DZ), ETH Zurich
#  Created    : 2015-07-16
#  Last update: 2015-07-16
##########################################################################
#  Description : insert the io filler cells.
#  Inputs      : 
#  Outputs     :
#  Resources   :
##########################################################################
#  Copyright (c) 2015 Microelectronics Design Center, ETH Zurich
##########################################################################
# v0.1  - <muheim@ee.ethz.ch> - Thu Jul 16 17:28:07 CEST 2015
#  - copy from umcL65 adapt it
##########################################################################

addIoFiller -cell PFILL10_18_18_NT_DR -prefix FP
addIoFiller -cell PFILL5_18_18_NT_DR -prefix FP
addIoFiller -cell PFILL2_18_18_NT_DR -prefix FP
addIoFiller -cell PFILL1NC_18_18_NT_DR -prefix FP
addIoFiller -cell PFILL1NC_18_18_NT_DR -prefix FP1NC -fillAnyGap
  # fills also smaller gabs, this is OK, the drc is complaining!
  
redraw
